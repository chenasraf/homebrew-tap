class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "27d32449d959842f78592f650e9e06fd3545c0244e9c25dce58c63fcda2839fa"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4ae26b328a05829311bcd38fea9dfa3ecfe976a0155033a9fe7a25c5caaa9c45"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "c644e4c13e8c91f6abc9966a21d711f17d0c73d60c89ab14e259d41a85e95e43"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "921b7446d571491415c7f62e617d4f25eda7af770d65d9f5281906d3a60c0bf6"
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
