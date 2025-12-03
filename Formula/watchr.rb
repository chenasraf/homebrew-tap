class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "ff15abad1614caed8ca79cedb3f47de24fa1144bc40855004a77b63edce5a8b6"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7d27fc35ba8da3c41a8f316f4e72242416fc65596e28020d02f8b1dffeae6df3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "24fe4ebdd66d7ac35fbb7ea38d8dc48f21eb3b04320d04543170cde84ad9cb9d"
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
