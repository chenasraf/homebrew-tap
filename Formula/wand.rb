class Wand < Formula
  desc "YAML-driven command runner with nested subcommands"
  homepage "https://github.com/chenasraf/wand"
  url "https://github.com/chenasraf/wand/archive/refs/tags/v1.6.2.tar.gz"
  sha256 "b98dabe7138686541448fe6a490e9ebcef2b48262853a50d676c2ac43a79a7eb"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/wand-1.6.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "19e084cadf0cef432f3ad3f88d2015e14d3405487face246e6325e3569b6e138"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d6c36456a6b3b4cdf1a98cd8c3f5d8ad2aa022b866b7ac926ff5f808b9184223"
    sha256 cellar: :any,                 x86_64_linux:  "e9cc83fbda722ce3f9d7dae1bb685c4d1e83eb269ac27c3d65fca298ddec9a7e"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "wand", "."
    bin.install "wand"
  end

  test do
    (testpath/"wand.yml").write <<~YAML
      main:
        description: A test command
        cmd: echo test
    YAML
    output = shell_output("#{bin}/wand -h")
    assert_match "A test command", output
    assert_match "Usage:", output
    assert_match "wand [flags]", output
  end
end
