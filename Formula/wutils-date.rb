class WutilsDate < Formula
  desc "Display and save current date/time in a loop"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6eeac18a41ba9a93dd7045a289e4c90e7bd692027ee5e606022a7b146485dd6c"
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
