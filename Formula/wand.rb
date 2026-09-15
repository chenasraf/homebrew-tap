class Wand < Formula
  desc "YAML-driven command runner with nested subcommands"
  homepage "https://github.com/chenasraf/wand"
  url "https://github.com/chenasraf/wand/archive/refs/tags/v1.6.1.tar.gz"
  sha256 "c6fbd3a2ea279fb5b868fbc559c398f9ca961a741f8a8a70ea1069f4347b7ab3"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/wand-1.6.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "e1b8544f57b3991b99a0928920c9bf13bcf20174e216fa3b47b93645e59a288c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2f6a1f20d7e8046cff30eef75b5bd1968236133a7ab33072d0e058d8ed01c096"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "088c6f237df6a65d7dd1fead18d8e5523be70df3458b3227666bce9f22faf788"
    sha256 cellar: :any,                 x86_64_linux:  "1fc899078d3a98428d35ee5b3b066a2448e1e516d36638a936242e86909a8cd8"
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
