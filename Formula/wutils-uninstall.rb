class WutilsUninstall < Formula
  desc "Uninstall all wutils formulas"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "bfc0fa10c559339b48cad5704a475f08dd14150249b4ce5afc341eeea49b282e"
  license "MIT"
  version "1.0.0"

  def install
    bin.install "uninstall.sh" => "wutils-uninstall"
    chmod 0755, bin/"wutils-uninstall"
  end

  def caveats
    <<~EOS
      Run 'wutils-uninstall' to uninstall all wutils formulas.
      Use 'wutils-uninstall -v' for verbose output.
    EOS
  end

  test do
    system "true"
  end
end
