class GiGen < Formula
  desc "Gitignore generator for any type of project"
  homepage "https://casraf.dev"
  url "https://github.com/chenasraf/gi_gen/archive/refs/tags/v0.3.13.tar.gz"
  sha256 "be417fb34494e26d81f054c762998ea1078e637d4b1b712b97d3b77c237922d0"
  license "MIT"

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "gi_gen", "."
    bin.install "gi_gen"
  end

  test do
    assert_match "Usage: gi_gen [options]", shell_output("gi_gen -h 2>&1 | head -1")
  end
end
