class CospendCli < Formula
  desc "Command-line interface for adding expenses to Nextcloud Cospend projects"
  homepage "https://github.com/chenasraf/cospend-cli"
  url "https://github.com/chenasraf/cospend-cli/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "321c998d8506c3f568364d80aab9a3cfd74f03d53af9b5314f7898c415b17d1b"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/cospend-cli-1.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7a58d50f4259d70d5340c28f4b8979498c07cdca4c96f1e5b87f1210581a3338"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "7d79b229f39f7b4a6e375d13da63df9e8361c1b6038a08fb5019630154c7d650"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6e5ab38d26c81e2afcbe3cadfc5ad44f68b76b4cc5c067543ebe834e782d8d78"
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
