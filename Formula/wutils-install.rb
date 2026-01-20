class WutilsInstall < Formula
  desc "Install all wutils formulas"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "cee42c07f0df4e951c89355d93c5d16cb902a45d356f93cadfc3a2207fd05c1d"
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
