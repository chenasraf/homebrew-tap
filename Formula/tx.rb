class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.7.0.tar.gz"
  sha256 "ec89c7e1ac6523f50d39ddcbf5a1d727912b62e2b9eee327fb35b4b26374cb55"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.6.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "c254d49436cad7a92dc4bfe42af0f394bf37636d98e7cd1e4a59764fb443c642"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "39681171063038391a1e32b7e66b2cb07b7ef597079d9e973eba8af85a7ceeec"
    sha256 cellar: :any,                 x86_64_linux:  "c31df32d1dfee229d0e59845d6de79ff515b54d20bf1dbf46d7c09e48f424a79"
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
