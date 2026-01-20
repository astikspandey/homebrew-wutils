class WutilsAscii < Formula
  desc "ASCII art text generator using 5x7 font"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "bfc0fa10c559339b48cad5704a475f08dd14150249b4ce5afc341eeea49b282e"
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
