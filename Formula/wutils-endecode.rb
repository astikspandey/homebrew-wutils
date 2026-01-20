class WutilsEndecode < Formula
  desc "Encode and decode strings using XOR and base64"
  homepage "https://github.com/atikspandey/homebrew-wutils"
  url "https://github.com/atikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"
  version "1.0.0"

  depends_on "python@3"

  def install
    bin.install "endecode.py" => "endecode"
  end

  test do
    output = shell_output("#{bin}/endecode encode test mykey")
    assert_match "@x1:", output
  end
end
