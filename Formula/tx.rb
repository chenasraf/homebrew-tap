class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "e5ba138aaa0c850d9e0084525c92d93eb7fdf3c3cc04694da7b846f75161912a"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-1.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "43e7f08e9f9f0cb08d47b9d27215ed02f906511be41c76557e109822db1d8564"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "bb28cf6e1a8cdf14f85828e070fb236310b2dea2d72dc1764b5b52da1c567008"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "23a1e768fff5f92932bb98675479e35bd53e635d7d828adc7aba994eb413049a"
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
