class WutilsLoop < Formula
  desc "Run commands repeatedly at specified intervals"
  homepage "https://github.com/atikspandey/homebrew-wutils"
  url "https://github.com/atikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
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
