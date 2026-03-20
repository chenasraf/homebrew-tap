class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.0.0.tar.gz"
  sha256 "134131ac690793400db4aa25b00a5daa3fb0659ceeefa16a96286addb5dac140"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "29e6ec7c425f6c2b683d8d311d10d19a468a6367806a8a0963e492fe9f19a45f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "0da40cf5e7bacb2ebd562fbe5b4cf9660adbf37e87cfaa00941121b04df18949"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4be2dd6b428ed701cc8473864531d6d0138098046a875e637ea7816227dfaefd"
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
