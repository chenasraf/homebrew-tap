class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "6b1da7dd45ec0863a673505fafdc0e049d1d419178384e97db403bc68496169e"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.8.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a819251c910b692f2a3b2dc169afdf93b988e9325db22ff899b9b7eb4d098b10"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "25de0c043d19446433b0bc3f720f13c5a9be618aefb91850f0003c133af71eeb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "269be4cc4eb7fa55723481b41049c64bb1a53d60b874aedae252dc640cdb5952"
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
