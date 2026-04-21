class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.4.1.tar.gz"
  sha256 "1dc65d75cf5e5f5c9081be0ae08ddcaed81724bbc0c2eda45b9c485941ea8581"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b726c5d566a4e257cadc77fd8f9f4c5947e53af681960c03edd4e5f017dec592"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "54ff289ebb1d6a40886d9da51ef53856905a3bc1d5c9974c39d82638fd7d3de8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a82993a3d3408b6ccf858d46ebd268a387250d2e0fe5f2ca9675d100a6ed8a4e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ac00a4ba0624ff32fb14d4f3a4a15e3554fe003bdedccb6f054289717251e230"
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
