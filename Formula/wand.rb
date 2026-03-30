class Wand < Formula
  desc "YAML-driven command runner with nested subcommands"
  homepage "https://github.com/chenasraf/wand"
  url "https://github.com/chenasraf/wand/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "f3dc53c355ba1fb5468d3870b68b960a50a321b9ec84d979d3a3bc5926ddc0fe"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/wand-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "dff1da5d2667c895cdfea9ccc0b7daa5963bab140727dbe660b693ed38f5dead"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "63ac27d7e88807eb032f0eef55703f5caeac8d80d3a5709780b144fad3e7e382"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "eee42d723d5cfd02149450670bd0ad579f421d4c0015ced9e41922822ab178cd"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "23195da128e8e68d9dafbe9f9919554dd1445932cbea6cb04f9670fee7384cd4"
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
