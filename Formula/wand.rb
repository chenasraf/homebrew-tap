class Wand < Formula
  desc "YAML-driven command runner with nested subcommands"
  homepage "https://github.com/chenasraf/wand"
  url "https://github.com/chenasraf/wand/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "9b88b2b72d7a39c098111957d733f1b02365ee5195878e01c63f6a8d3d825798"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/wand-1.3.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "1d6401d82e0f29678eeb1eec3c473a90d9a1618aedf36984fdef066c92efa1c3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d5fe2171bceff1faaf639d401776c82ac8ef47b03585b9a88d2835b2303a01e7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ae33f40539a858fa49def1efcd9ea830770f72515b33cbef4d6172fe1aaef2f4"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0c6777d3c7d2f33fd0ba5b2e813b763cc73d03fc5812b238799eb8a3dbd2e2af"
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
