class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "f3d25164b213f0f5f383c83ff2f45250e2fe591e5cd2d3be6ad32977cffe6310"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d12ae4abe156a329649852ae8a60097193e925a34bc1a154995d12e20c659d35"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "af9284e46d1669ce664c5b00bde0785cf66364a8735cfa53d6850ca9d5fdf92d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "903cebc276bb4d5f4a15402db59b6023835606f69b70d8e0de68a24e5e73a21d"
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
