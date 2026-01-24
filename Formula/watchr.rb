class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "660cf9121a8181fa8ba78bcb7c390501713f08004aa54a377615440486adbbef"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.5.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "54320e8c60384c64fad89b88c8af5c5e256d4421fe163e38fed78bc82d85187a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "507c6ccec5d5467322d2c7183071354338403dee5a64f1afffb48c08317d1e55"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "72db54806255740638484ce678588092b437b999f695e1498c341ef92fa49d6d"
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
