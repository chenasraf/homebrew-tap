class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "660cf9121a8181fa8ba78bcb7c390501713f08004aa54a377615440486adbbef"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f20efe875f5ea4d4d23278129585c2633931949d20f4470aafc0f606687286bd"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4bb22f7838833f458bd33eaae67206e69281aec0917efbccf70864fa86967b74"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "28c7941ea800ed06a273b199cd2daa80cadca1a36ccb946d71869e33e0d038c6"
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
