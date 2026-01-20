#define _POSIX_C_SOURCE 200809L
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <sys/wait.h>
#include <string.h>
#include <errno.h>

#define INITIAL_BUF 4096

static long long now_ns(void) {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (long long)ts.tv_sec * 1000000000LL + ts.tv_nsec;
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        fprintf(stderr, "Usage: %s <interval_ms> <command> [args...]\n", argv[0]);
        return 1;
    }

    long interval_ms = strtol(argv[1], NULL, 10);
    if (interval_ms <= 0) {
        fprintf(stderr, "Invalid interval: %s\n", argv[1]);
        return 1;
    }

    long long interval_ns = interval_ms * 1000000LL;

    char *buf = malloc(INITIAL_BUF);
    size_t cap = INITIAL_BUF;
    if (!buf) {
        perror("malloc");
        return 1;
    }

    long long program_start = now_ns();
    long long last_refresh = program_start;

    for (;;) {
        long long start = now_ns();

        int pipefd[2];
        if (pipe(pipefd) == -1) {
            perror("pipe");
            break;
        }

        pid_t pid = fork();
        if (pid == 0) {
            close(pipefd[0]);
            dup2(pipefd[1], STDOUT_FILENO);
            dup2(pipefd[1], STDERR_FILENO);
            close(pipefd[1]);
            execvp(argv[2], &argv[2]);
            perror("execvp");
            _exit(1);
        }

        close(pipefd[1]);

        size_t len = 0;
        ssize_t r;
        while ((r = read(pipefd[0], buf + len, cap - len - 1)) > 0) {
            len += r;
            if (len >= cap - 1) {
                cap *= 2;
                char *tmp = realloc(buf, cap);
                if (!tmp) {
                    perror("realloc");
                    exit(1);
                }
                buf = tmp;
            }
        }

        close(pipefd[0]);
        waitpid(pid, NULL, 0);

        if (len > 0) {
            buf[len] = '\0';

            long long now = now_ns();
            double since_start = (now - program_start) / 1e9;
            double since_refresh = (now - last_refresh) / 1e9;
            last_refresh = now;

            const char *home = getenv("HOME");
            char datebuf[256] = "";
            if (home) {
                char path[512];
                snprintf(path, sizeof(path), "~/Wutils/date.txt", home);
                FILE *dt = fopen(path, "r");
                if (dt) {
                    fgets(datebuf, sizeof(datebuf), dt);
                    fclose(dt);
                }
            }

            write(STDOUT_FILENO, "\033[2J\033[H", 7);

            if (datebuf[0]) {
                printf("Time: %s", datebuf);
            }
            printf("Running for: %.2fs | Last refresh: %.3fs | Interval: %ldms\n",
                   since_start, since_refresh, interval_ms);
            printf("------------------------------------------------------------\n");

            fputs(buf, stdout);
            fflush(stdout);
        }

        long long elapsed = now_ns() - start;
        if (elapsed < interval_ns) {
            struct timespec ts;
            ts.tv_sec = 0;
            ts.tv_nsec = interval_ns - elapsed;
            nanosleep(&ts, NULL);
        }
    }

    free(buf);
    return 0;
}
