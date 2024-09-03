class Treelike < Formula
  desc "Outputs a Tree-like representation from strings"
  homepage "https://github.com/chenasraf/treelike"
  url "https://github.com/chenasraf/treelike/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "ec88b555fc92510b8a179407c1e4763e5e4f4e411a24c26b892c21e403b0b138"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/treelike-1.1.0"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5283e611d14c11f2cd9ff2255f14532b4ae769cdc29b74f1ad29fbd949395248"
    sha256 cellar: :any_skip_relocation, ventura:      "724d8dea99c3052696c3e28f8e791649e802988016ca93a2c42276b001178e1a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9b0382cda377ea3ed5a2bddf795bfe4cc42b764a59b23be2c7577295db12c94b"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "treelike", "."
    bin.install "treelike"
  end

  test do
    assert_match ".\n└── a\n    └── b\n", shell_output("echo 'a\n  b' | #{bin}/treelike -")
  end
end
