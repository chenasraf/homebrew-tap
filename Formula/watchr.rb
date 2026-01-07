class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.5.1.tar.gz"
  sha256 "3335295a4a94120eb8bcdf9cbd7793a018a65c16a806d482331a4311f879b655"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.5.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d62f31ba463999c953d951453a437a07e802405fbaa5ae1feed3b4364f4d2d4f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e5453ae4e85c8dddc6030d7649a8c05d3d1f5a5b4cd5c5e8e75a30b0ab56aa86"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a935a0cb29f698b01e768f3a002740a8c71313e026eeb7ef00e5a97cc31a3d0c"
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
