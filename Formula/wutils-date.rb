class WutilsDate < Formula
  desc "Display and save current date/time in a loop"
  homepage "https://github.com/astikspandey/homebrew-wutils"
  url "https://github.com/astikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "2be3070f4da298407895e883e27edcda5b82c2dbf98ca2228db9eec0b501da65"
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
