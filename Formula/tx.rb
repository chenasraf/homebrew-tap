class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "dfc94d97902d4b40564bb5a54aed9c6783ccbef7852ce1caafb0c0963ef25462"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-1.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "95ea861a25be639e3287fd5820305b76ef29bfd8a7cd4d5739dfb8601c0e9ead"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "1c35db474206735ef3a4cfda4a4de2c4d4ea76c28f6b5eb91ef6280dabb1bfac"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3b84af118d5f4603f00e923c1028a2db4cae5027d5b0056feb1df925f2fec5f8"
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
