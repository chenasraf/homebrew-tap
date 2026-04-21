class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.4.1.tar.gz"
  sha256 "1dc65d75cf5e5f5c9081be0ae08ddcaed81724bbc0c2eda45b9c485941ea8581"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.4.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "c4862a340b26b34a86d20f5a12327313001911861f6c08409ec6014e42e2e189"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ab585f3fbcedff4c6a9658c4bebca52544549764b1e2cf73c779b493aa298f73"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "132107142d6f9f63e70c48fd531ff0ca2356f3939798c2157e5d044ef955a232"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4d35bfb3a1b411a87988babee2936bda12315a78a1f2697fa139e81b5c9603ff"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "tx", "."
    bin.install "tx"
  end

  test do
    msg = "tx is a tmux session manager that creates sessions from YAML configuration files."
    assert_match msg, shell_output("#{bin}/tx -h")
  end
end
