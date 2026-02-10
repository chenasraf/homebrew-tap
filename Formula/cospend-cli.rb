class CospendCli < Formula
  desc "Command-line interface for adding expenses to Nextcloud Cospend projects"
  homepage "https://github.com/chenasraf/cospend-cli"
  url "https://github.com/chenasraf/cospend-cli/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "42399b26d2bfd9d7267834ac659b255be37f07dad3ca71f1150fb28eb2bfdbac"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/cospend-cli-1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "e164ad77e55acb561a59f49ce9af05e6338e92a3d8a79fd148b049d2f98bafe8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "820cb081073892184356f8df158c92c0f5305b686b417bd5232c40095399598b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "81084fc7a7d7a9c4724a59d4d0a192a9d96df6628fac5b277621753baf16995e"
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
