class Wand < Formula
  desc "YAML-driven command runner with nested subcommands"
  homepage "https://github.com/chenasraf/wand"
  url "https://github.com/chenasraf/wand/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "5f6053b30ae0ff8c9fd0bd240905fe9037410bd84080557f5967b1ed5b705077"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/wand-1.6.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "edb11b939718f9f289f219561bc9bd7d370ec6f823f8f44915cbd70a9bab89dc"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b48347acbe341931f792ca8e2996951fd36dbb4dc77c94fed1dba5d22797e0f2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "c9ecb14251a48b99a308d6d7462a778096270ec0fd70b77623f6032b413195e2"
    sha256 cellar: :any,                 x86_64_linux:  "b143e3b08389fcb1d1248843bd1eebc0169c493849bc45408328a4a48c4b8024"
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
