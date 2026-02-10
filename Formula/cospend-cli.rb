class CospendCli < Formula
  desc "Command-line interface for adding expenses to Nextcloud Cospend projects"
  homepage "https://github.com/chenasraf/cospend-cli"
  url "https://github.com/chenasraf/cospend-cli/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "42399b26d2bfd9d7267834ac659b255be37f07dad3ca71f1150fb28eb2bfdbac"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/cospend-cli-1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "937082f8d93c307cc52d3e47ccb7d48b4c23a19479c9af8656ae42b6f999b72b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "bc1ca9132e17ba53cbd094afdf3822f2a104c87ae9af9257b1b6301de8484817"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8ccdee3b1ac03f45359fd059c1e4c89052c5e0bd3c04401a1f78ed76f6f2c50f"
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
