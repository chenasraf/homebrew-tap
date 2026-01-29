class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "f3d25164b213f0f5f383c83ff2f45250e2fe591e5cd2d3be6ad32977cffe6310"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "20121a0bb79150d4293fb1ace90d211db5b354c1d63bf7428bbd9b23560b81f4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "27b83fb710424292e0928c10f4a0a64fe7b7a3ff7933cf891a5b6ffc2bc9fab0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "4bf6c38e3d5684d46dd9087f3c869d04c1639c533009d87982a30dc968af325f"
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
