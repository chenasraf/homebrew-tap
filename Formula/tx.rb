class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "39eb5028298c2a50c77f74f206ce2d63c11e40fe69bf6016f82cdd49cf5b8542"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "de1748424aa1c52d6c5adfcfef365e1445a1da44609555fd8e2eacc69aadf6d5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a0c4d879f5ca458339c2730ef0fc8538f64d1ab3b4cb5bc950567abf3f8950fe"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "78b20c79c167295300529881628dacdbdb7d8161507c3f3b08333e9c7083f63e"
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
