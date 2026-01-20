class WutilsFilegen < Formula
  desc "Generate files of specified size"
  homepage "https://github.com/atikspandey/homebrew-wutils"
  url "https://github.com/atikspandey/homebrew-wutils/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"
  version "1.0.0"

  def install
    bin.install "filegen.sh" => "filegen"
  end

  test do
    system "true"
  end
end
