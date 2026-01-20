class WutilsLoop < Formula
  desc "Run commands repeatedly at specified intervals"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6d56132beacf604ccd673180f2b2e1ecc808c02076a5c73692854315015a7ad8"
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
