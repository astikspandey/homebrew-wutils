class WutilsFilegen < Formula
  desc "Generate files of specified size"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6d56132beacf604ccd673180f2b2e1ecc808c02076a5c73692854315015a7ad8"
  license "MIT"
  version "1.0.0"

  def install
    bin.install "filegen.sh" => "filegen"
    chmod 0755, bin/"filegen"
  end

  test do
    system "true"
  end
end
