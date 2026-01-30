class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "57017d0bd643a92fcbd3e4c885303d942d82b375bdb2eadee83de4f88cf826bb"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d15cc40e3bfe58aa46d702047d596e3379a2974724d3b0aea2f09717d3e34ee7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "96f596a9b33e4765d922c8025b7e0eff1ae6115c6e55eea0dcf9ca005bfe2ba0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a209ffbac503f03cfa7e2354b7ba98a4a464d75d1788912313d3dcfd7595335e"
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
