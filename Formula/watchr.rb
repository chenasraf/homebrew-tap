class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6cde8fc8f50bb02d94bbed6a4c8c13cb85929097da38b8986764dc19ccf22cb4"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "728f8a101e1c6f0afc0f0c7f37352e3faf12cbdcaa8eeb9bb86d4d0b6c5f5bd2"
    sha256 cellar: :any_skip_relocation, ventura:      "51fbc2d85f8e4fb01f3874db88da74b12d1fa227c83f72d088d0c2956264bb67"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5abace5d36a881b5ca59b221916393b38879ef7acf43a9e3626eaa2b4c25a790"
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
