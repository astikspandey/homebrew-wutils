class WutilsInstall < Formula
  desc "Install all wutils formulas"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "70849dfe26c0256ac270c9f21e273d0cf204216e546f21b42f6f3570de766add"
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
