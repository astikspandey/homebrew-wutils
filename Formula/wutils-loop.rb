class WutilsLoop < Formula
  desc "Run commands repeatedly at specified intervals"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "cee42c07f0df4e951c89355d93c5d16cb902a45d356f93cadfc3a2207fd05c1d"
  license "MIT"
  version "1.0.0"

  def install
    system ENV.cc, "-o", "loop", "loop.c", "-O2"
    bin.install "loop"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/loop 2>&1", 1)
  end
end
