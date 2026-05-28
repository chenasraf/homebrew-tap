class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.5.3.tar.gz"
  sha256 "b6699b63b8d73276bb0b00d2d77112e54c2d9fdd7659abfc9e2fab10ba4dfc1a"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.5.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "29015690491712c8bddfa531fd728fa19f72f9f5447aa4e7dd9c499639d1902a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "65d57ba8d8b2ae0c42bef0b6101d5a72d1e5f10ae2531424689b6609d2591a28"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a00c32c8d6a4d95521acd18db7bde3b8b7a81dc0799bc752820e17ea6aa1d927"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ca2cbd493beb56aeee91e179acadc9f97f291327f82c4813d5d4b0a877bf3c3f"
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
