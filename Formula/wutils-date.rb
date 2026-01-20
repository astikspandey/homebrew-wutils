class WutilsDate < Formula
  desc "Display and save current date/time in a loop"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "bfc0fa10c559339b48cad5704a475f08dd14150249b4ce5afc341eeea49b282e"
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
