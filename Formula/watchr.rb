class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.10.1.tar.gz"
  sha256 "1b6afeeebcd728f19f794f17d4824a27302ce274eb380c1f4c6812131cfd1337"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.10.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "98b59d3b7359170991c30dfc22df18d0cc3c1c0fa3f6c8238489dfce7646ed16"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ab519dfe02e82f32ddd6f4faf10ff9af7e21686b8a8817e084952c0c5365a717"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "43ac19471b5d7467639b60f968372abd3c79e69c0122a1d39eb3f999d4e6a51f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3035202a65da991b26a19f02651ad178a232a1f90d8447934ac3b571293a5941"
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
