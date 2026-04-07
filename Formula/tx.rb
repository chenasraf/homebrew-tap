class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.4.0.tar.gz"
  sha256 "2f9a9cdf776b004d684a8d492466e14c932cac1f1c964ddc5a49f8e82b0255ff"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "6a790827786adc21a75da9ffc69c9a647268d5a6fd2762c0c75c0d906cce0622"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e5a601d9f4759e1d226c32b769cbff02cf4f49d95538020fc6a3aa568ad62033"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "5912184af4b6659eb9ce2da47ea8c70ff1d3d9f3ac6dda1981aedc231b0630fe"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0a20950eeeded3ef2df28c7c6e32a91f6ba24c5e5a5d556cf6cfb20ea6efeaf8"
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
