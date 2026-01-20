class WutilsDate < Formula
  desc "Display and save current date/time in a loop"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6d56132beacf604ccd673180f2b2e1ecc808c02076a5c73692854315015a7ad8"
  license "MIT"
  version "1.0.0"

  def install
    bin.install "date.sh" => "wdate"
    chmod 0755, bin/"wdate"
  end

  test do
    system "true"
  end
end
