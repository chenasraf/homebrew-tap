class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.8.1.tar.gz"
  sha256 "357bfb5f7a0a5acd183fbd13fa4c5a18dbc4e0f45e509644886d6a70bfcef53b"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.8.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "6efd68804ea852fd8dd369c654b6c4d515d6ed0adc2dcc31024ed30e3ac07ffb"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4dd02ea9aa68d545afc771bf5dbfd77078ba6d75559e3565393967b6e11105ef"
    sha256 cellar: :any,                 x86_64_linux:  "5c1c38a19d82c9224f00d3107813f912cfde1129bb8c467dd64adc67f4871531"
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
