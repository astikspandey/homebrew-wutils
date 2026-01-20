class WutilsAscii < Formula
  desc "ASCII art text generator using 5x7 font"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "89f257c250310a9cd21be9b22e9d21a0fdad576f75050fd9e425f6932a815bda"
  license "MIT"
  version "1.0.0"

  def install
    bin.install "ascii.sh" => "ascii"
    chmod 0755, bin/"ascii"
  end

  test do
    assert_match "#", shell_output("#{bin}/ascii A")
  end
end
