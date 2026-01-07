class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "3335295a4a94120eb8bcdf9cbd7793a018a65c16a806d482331a4311f879b655"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c06aa77e7862060744abd8001d9dce4f75c4812a0be74048be0589fb1f7a06ec"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a1c1e508b2f71ada28917a1af2b463833916a9ab5ac1ede92322b78a76f65a03"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "36b21d57774624e8be3d8a1bd81c7d957b0b1b9e768b29eba3fc3eebd46c1114"
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
