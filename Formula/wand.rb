class Wand < Formula
  desc "YAML-driven command runner with nested subcommands"
  homepage "https://github.com/chenasraf/wand"
  url "https://github.com/chenasraf/wand/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "c6ecf2cb5798d6223093d9a6b195588816438342ffda586ae61cea74f548dab6"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/wand-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "0e283e81872dfec7da634f4179e7d0e9dc24c6409a86d2975e23d10c01706bc8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b194089ad108282953910df34aea08404b47ba5d6a18db97514c9701e23a4f6a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d7400de5aa8869fcee661714b1bcc02427b5bdbb0c2c9dd09ccdc4b08d6d6fbe"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1a52d73cbe069b597639896821152c8f42f96f9683ea18be310ad91c79ad7c9e"
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
