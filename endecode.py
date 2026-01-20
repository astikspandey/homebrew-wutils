#!/usr/bin/env python3
import base64
import sys

SALT = b"\x13\x37\xC0\xDE"  # fixed, intentionally dumb


def xor_bytes(data: bytes, key: bytes) -> bytes:
    return bytes(b ^ key[i % len(key)] for i, b in enumerate(data))


def encode_auth(plaintext: str, key: str) -> str:
    key_bytes = key.encode("utf-8")

    # --- key block ---
    xored_key = xor_bytes(key_bytes, SALT)
    key_block = base64.b32encode(xored_key).decode("ascii")

    # --- data block ---
    data = plaintext.encode("utf-8")
    xored_data = xor_bytes(data, key_bytes)
    step1 = base64.b64encode(xored_data)
    step2 = base64.b32encode(step1)
    step3 = base64.b64encode(step2)
    step4 = base64.b32encode(step3)
    data_block = step4.decode("ascii")

    return f"@x1:{key_block}::{data_block}"


def decode_auth(encoded: str) -> str:
    if not encoded.startswith("@x1:"):
        raise ValueError("Invalid format")

    key_part, data_part = encoded[4:].split("::", 1)

    # --- recover key ---
    key_xored = base64.b32decode(key_part)
    key_bytes = xor_bytes(key_xored, SALT)

    # --- recover data ---
    step4 = base64.b32decode(data_part)
    step3 = base64.b64decode(step4)
    step2 = base64.b32decode(step3)
    step1 = base64.b64decode(step2)

    original = xor_bytes(step1, key_bytes)
    return original.decode("utf-8")


def main():
    if len(sys.argv) < 3:
        print(
            "Usage:\n"
            "  encode <PLAINTEXT> <KEY>\n"
            "  decode <ENCODED_STRING>"
        )
        sys.exit(1)

    mode = sys.argv[1].lower()

    if mode == "encode":
        if len(sys.argv) != 4:
            print("encode requires PLAINTEXT and KEY")
            sys.exit(1)

        plaintext = sys.argv[2]
        key = sys.argv[3]
        print(encode_auth(plaintext, key))

    elif mode == "decode":
        encoded = sys.argv[2]
        print(decode_auth(encoded))

    else:
        print("Unknown mode:", mode)
        sys.exit(1)


if __name__ == "__main__":
    main()
