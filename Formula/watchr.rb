class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.10.0.tar.gz"
  sha256 "320dfe85a4a7a0c3ab3a03b7e483b8a2c113c3be3feef0ad0fcd6db643546606"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.9.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "09bcaf6d39e176174278bc799d378f9af29d9fab00ee1125fd2c57793348a47e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "21daa43421bfb740633fdbc8ee5760f6b6a7eeaa7437c1e0a08fb71dc76480cc"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "be22811c69f8a674b1db52cbe5433e6cdfe3857d3910fe5a8ed2f30c0e8cc6bb"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "watchr", "."
    bin.install "watchr"
  end

  test do
    assert_match "Usage: watchr [options] <command to run>", shell_output("#{bin}/watchr -h")
  end
end
