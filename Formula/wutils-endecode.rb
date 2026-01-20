class WutilsEndecode < Formula
  desc "Encode and decode strings using XOR and base64"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6eeac18a41ba9a93dd7045a289e4c90e7bd692027ee5e606022a7b146485dd6c"
  license "MIT"
  version "1.0.0"

  depends_on "python@3"

  def install
    bin.install "endecode.py" => "endecode"
    chmod 0755, bin/"endecode"
  end

  test do
    output = shell_output("#{bin}/endecode encode test mykey")
    assert_match "@x1:", output
  end
end
