class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "13d2aba992153db3ec3c73e3f26564b1b9a5b7c9dd497736de8e590859413ecf"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d252aa04e32530899d6187ad15f47b65d1c9104088f4a89348fe79ea0a864162"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "27e24f806898c51afec518e26f2dec27f948553e0253dccc5365f5717d56e5c2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "582dbf6d4a3383f33b27eaf8f826bf24282cd79d3dbf766eec10251a8686a6c6"
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
