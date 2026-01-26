class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "4b2300c4203f75c8cabd6fe34f938d017809c0096a5515b1a63d4cf88afda427"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.7.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d8314ac8d2ab6f034a2083510a06bf51473252c54d2b00ebad8ff2187d1f682f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "83cb2460bf8e57cc1343530c1ae15ff7195095ff536b16cfbdf1e8295dc2bbb1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2b3487c87e9a7714d3fb10e7c1a5e671afd57511eeaee3921fa75817ed847528"
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
