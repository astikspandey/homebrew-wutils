class WutilsEndecode < Formula
  desc "Encode and decode strings using XOR and base64"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "89f257c250310a9cd21be9b22e9d21a0fdad576f75050fd9e425f6932a815bda"
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
