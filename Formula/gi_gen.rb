class GiGen < Formula
  desc "Gitignore generator for any type of project"
  homepage "https://casraf.dev"
  url "https://github.com/chenasraf/gi_gen/archive/refs/tags/v0.3.13.tar.gz"
  sha256 "be417fb34494e26d81f054c762998ea1078e637d4b1b712b97d3b77c237922d0"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/gi_gen-0.3.13"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "1455b89045c458de796654a2ba763177a30c78a563d19b7db3241799c9ef209c"
    sha256 cellar: :any_skip_relocation, ventura:      "e41d0000a1447f973fc40b4cf0c8d5d5b66c31da9f8513ffc3a96612350a1305"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b2d1a3a7b7b8ec83e614528f014879fe0563e2949daa0cf1424b2fa96ccd5899"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "gi_gen", "."
    bin.install "gi_gen"
  end

  test do
    assert_match "Usage: gi_gen [options]", shell_output("#{bin}/gi_gen -h 2>&1 | head -1")
  end
end
