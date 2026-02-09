class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "27d32449d959842f78592f650e9e06fd3545c0244e9c25dce58c63fcda2839fa"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "70ec3567b1bde2b8d7315ef3a41d4713f84917ce7ca5c6c76f222a2a9196da53"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "611d721767438d1c3ddeedd231b193bd8d47a209f8008eb531e1d3ab96b241e7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8b6855b1ca6f9fd703e6a1a1b72dd23460b4f5e93d1edcb34e7663bde967c3ac"
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
