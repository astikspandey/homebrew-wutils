class WutilsEndecode < Formula
  desc "Encode and decode strings using XOR and base64"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ce2f18e6559367b226de19c435c0f2c85a6e5e9841104ae3f10299bb01ded298"
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
