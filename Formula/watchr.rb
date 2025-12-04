class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "8d87d839cef196706b86fe07d17774ff7d3c9e4578104978a7dca000c0662cdc"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8d95e38bbeb7697b43de570794bce2282daf0a7ae31defb59336bbef24fc9f94"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4b49b3ad2c19eedee56aea07e96e59a989713417826f92b242d3130b631fcc91"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bcd419257e2b7c5f8d528147f792fa8d94eb930e5886dcf499e83ea8ca8d21ce"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "watchr", "."
    bin.install "watchr"
  end

  test do
    assert_match "Usage: watchr [options] <command to run>", shell_output("#{bin}/watchr -h")
  end
end
