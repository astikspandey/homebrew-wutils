class WutilsFilegen < Formula
  desc "Generate files of specified size"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "ce2f18e6559367b226de19c435c0f2c85a6e5e9841104ae3f10299bb01ded298"
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
