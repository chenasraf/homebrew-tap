class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "13d2aba992153db3ec3c73e3f26564b1b9a5b7c9dd497736de8e590859413ecf"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "9421a3d475c90ab3ed91eade632b59e8cee25127d5651fdbc09f11c0f843b1bb"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "fcce8000258f0af99b55a84b6a702de80d1356b42321770387ff0e57af86dbe2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "b60b04f1beddcfb34bfd21875a3972890827ea805519858e8814ff3b2df8c084"
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
