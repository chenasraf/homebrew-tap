class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.8.1.tar.gz"
  sha256 "357bfb5f7a0a5acd183fbd13fa4c5a18dbc4e0f45e509644886d6a70bfcef53b"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.8.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "4bda7c7b08eca91c8f9a79ac434f0fd9c33ac9e30324200a74424eb304b8594b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "922e52d27d69f8a8054f09825e2a2bb1f36327ee316f71ce45e83b5efb64b3c4"
    sha256 cellar: :any,                 x86_64_linux:  "f9625cce063ddda50d2868713ae8fbe64d088f54911637f6ae4251aa59120ecf"
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
