class WutilsAscii < Formula
  desc "ASCII art text generator using 5x7 font"
  homepage "https://github.com/atikspandey/homebrew-wutils"
  url "https://github.com/atikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"
  version "1.0.0"

  def install
    bin.install "ascii.sh" => "ascii"
  end

  test do
    assert_match "#", shell_output("#{bin}/ascii A")
  end
end
