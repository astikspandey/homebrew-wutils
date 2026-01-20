class WutilsFilegen < Formula
  desc "Generate files of specified size"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "3ec3bc0a75e7042449a8e5f0382127b0405098c094e638c8da43df58c6a61167"
  license "MIT"
  version "1.0.0"

  def install
    bin.install "filegen.sh" => "filegen"
  end

  test do
    system "true"
  end
end
