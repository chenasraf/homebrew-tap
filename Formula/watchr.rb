class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.10.2.tar.gz"
  sha256 "2e149c4d856881c07e39dc1d3bdaae26ac0ee3643122028b381655e390e9f9d8"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.10.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "5811a829f91f00df792f1a140742e16c25ebf33f62f2898661c43a7b39125ef9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "81f145ccc86366e68d6579836eb9791388f504656d595f50da0bfd48886f30fd"
    sha256 cellar: :any,                 x86_64_linux:  "64d52f64d495303ac5600f26609d17a804bd09d78293c85607281e74edebc01e"
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
