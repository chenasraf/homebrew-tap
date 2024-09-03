class Treelike < Formula
  desc "Outputs a Tree-like representation from strings"
  homepage "https://github.com/chenasraf/treelike"
  url "https://github.com/chenasraf/treelike/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "ec88b555fc92510b8a179407c1e4763e5e4f4e411a24c26b892c21e403b0b138"
  license "MIT"

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "treelike", "."
    bin.install "treelike"
  end

  test do
    assert_match ".\n└── a\n    └── b\n", shell_output("echo 'a\n  b' | treelike -")
  end
end
