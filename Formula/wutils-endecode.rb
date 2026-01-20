class WutilsEndecode < Formula
  desc "Encode and decode strings using XOR and base64"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7ef7d67b2a07ebc53e95f6f22a3c01c3a4f99097c9fd3f3f3a2d23a9f985e809"
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
