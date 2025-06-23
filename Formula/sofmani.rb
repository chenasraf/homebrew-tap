class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.9.3.tar.gz"
  sha256 "ef53112c0224a12a04433f1bfcdc509a13f08b85bbc1575b60002f9ecffbf7af"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.9.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "af5cce43801a51cc81da14c53f038122317afa950a8bf6c715fca5f76155a83a"
    sha256 cellar: :any_skip_relocation, ventura:      "773b6ba6aa9a9e6bd808f2048d2397ee2de89f4ad04f31ef95ed085720de85b4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f83943fd43b1a8bc7d83f109ccfa9414cf2de964ee4b242c4c4e59c5a3de57bc"
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
