class Wand < Formula
  desc "YAML-driven command runner with nested subcommands"
  homepage "https://github.com/chenasraf/wand"
  url "https://github.com/chenasraf/wand/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "f3dc53c355ba1fb5468d3870b68b960a50a321b9ec84d979d3a3bc5926ddc0fe"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/wand-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b9b86020d8d13b5a745c5d820b1b55125d54cf9c75e376a85c7a4c536fe30db0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2690f11caa2eac3db8011b78650fb1dfe76732b6965c8e1f72621184352fba3c"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "411e4294ae346f223fa75af8b20b3a50a2e11cb16206b92b40a415774d3bea5d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ae2a4d1e4c2200881ea58fdf94b9c9781df7ea16c0a522dcf8c8a5f8c3655393"
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
