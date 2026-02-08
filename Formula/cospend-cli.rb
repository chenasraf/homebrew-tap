class CospendCli < Formula
  desc "Command-line interface for adding expenses to Nextcloud Cospend projects"
  homepage "https://github.com/chenasraf/cospend-cli"
  url "https://github.com/chenasraf/cospend-cli/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "28086a1f1bb917a63bce75d30a6eb3ee9f51d722c05577a29b25db3eadea59b4"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/cospend-cli-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1422e9d243f640d554301fd4c03699e2b859d385a5622fcb4d59d52483eb146a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "14ad3439d8f107a63234efcd1e746a7d909449fb1fab3b2ec18b3675f67119e6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ca059b2b6551b50c3507e810c9782c57ea6efd098a4c719d38967425874023cf"
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
