class Wand < Formula
  desc "YAML-driven command runner with nested subcommands"
  homepage "https://github.com/chenasraf/wand"
  url "https://github.com/chenasraf/wand/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "9b88b2b72d7a39c098111957d733f1b02365ee5195878e01c63f6a8d3d825798"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/wand-1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "72cb46de897c2555aeefa18bfa81ac2d6c0c5ce882b28f8bb420120823748998"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "34f7e8afc3af0e5e663e95782de4022a844eabb35469ade53387226fb3acfb67"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "f25e2a669f9a41610ee3b9f9e098ac35ef62d3992ead76d0ad4d27d3114eca10"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c0b4de9576b08f38e6e75fd49a4c891c3b98a03c2e99d6c03afc4051c0c414d0"
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
