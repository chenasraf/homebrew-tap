class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "32bbe184b678562c4cda0d9d2eb7910d9043d2cc3e71863a2eebf4b1739018f0"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d0344562e094e5050ea5d4cd736080011af2a5ff50de589307875f30165f06eb"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "cedd95533909410d0c042341859ab7bf5e3f30d8c0c24b4dc1c115dc7f9e03b7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "03d3f04625c40b6ac977619dda2cb3a594fb4d10add117c042fdc1a5adf00b9f"
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
