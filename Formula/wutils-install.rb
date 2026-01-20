class WutilsInstall < Formula
  desc "Install all wutils formulas"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2be3070f4da298407895e883e27edcda5b82c2dbf98ca2228db9eec0b501da65"
  license "MIT"
  version "1.0.0"

  def install
    bin.install "install.sh" => "wutils-install"
    chmod 0755, bin/"wutils-install"
  end

  def caveats
    <<~EOS
      Run 'wutils-install' to install all wutils formulas.
    EOS
  end

  test do
    system "true"
  end
end
