class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.4.3.tar.gz"
  sha256 "d2f636d2d4b63f332d8b59b3cc0fec8da3a7540d494d334d86a7af0a407a5cf6"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.4.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "38ca4593a15cd32ca1d62ff5c788be15bc9f0d2b526808b660af97c84873f139"
    sha256 cellar: :any_skip_relocation, ventura:      "f01acde27e9d4cb38433d231dd9aabac143809bcfde7b4276d4945527d8d5f2a"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2549cd7e01f05c3f26a3c0fecafc548d43ff21a47159ad81c80ca569f77bf2f2"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "sofmani", "."
    bin.install "sofmani"
  end

  test do
    assert_match "Usage: sofmani [options] [config_file]", shell_output("#{bin}/sofmani -h")
  end
end
