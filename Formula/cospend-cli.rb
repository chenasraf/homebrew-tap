class CospendCli < Formula
  desc "Command-line interface for adding expenses to Nextcloud Cospend projects"
  homepage "https://github.com/chenasraf/cospend-cli"
  url "https://github.com/chenasraf/cospend-cli/archive/refs/tags/v1.8.1.tar.gz"
  sha256 "06175b1cca226d20900b105b47f9af6f8256ae3dc49d64ef56feb6f5b62b6ad6"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/cospend-cli-1.8.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "92ccf2353bd7264d9aa0eaab258e913aec81ff9d6b39795207f899452f096065"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "72f04abf706d2042961aa8244a73f002c9cdab9cc965fcaa9e41ccc29e52d188"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "37723eabad8d7b157783bb9e513ebdb6f27447e459349f4717c98b85842ac47b"
    sha256 cellar: :any,                 x86_64_linux:  "f2be0670b9460730ff6eac2444897ba1d8fe64f7712c5b0d29b1bd04d6c334f9"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "cospend", "."
    bin.install "cospend"
  end

  test do
    msg = "cospend is a command-line interface for adding expenses to Nextcloud Cospend projects."
    assert_match msg, shell_output("#{bin}/cospend -h")
  end
end
