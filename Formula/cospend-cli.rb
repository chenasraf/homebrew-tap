class CospendCli < Formula
  desc "Command-line interface for adding expenses to Nextcloud Cospend projects"
  homepage "https://github.com/chenasraf/cospend-cli"
  url "https://github.com/chenasraf/cospend-cli/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "cf9d548daf30183e7af9835d78a75538fa1c35ead565e67bc7f028c09ae884c2"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/cospend-cli-1.7.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "92c0aefab4bcdcdd3c97b38c08b82c150d3bfd2b392c0ba107f545caf54e30c2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "bb4b1c1bcf0c2a51c3dd58fdbf2c08bdad335163bf92a4a406fea0d063eea84f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5695a90ad24c0ad8f77dbe3c5e739440a118366142e849687da089c0a0273abf"
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
