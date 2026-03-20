class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "134131ac690793400db4aa25b00a5daa3fb0659ceeefa16a96286addb5dac140"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "919a42bc82b1d145b12e748661de2abaa4da28ba9d6f5d738b41a53c4163855f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ecd6671fc9e252f86aeebc92cf5bfd278052bb5b6cf77d58f9dd3010d1d37357"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "dd84ad5f4baa93fee19de140ef30d0130339fb1f20b108dfd83e38b93f0540bc"
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
