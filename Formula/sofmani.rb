class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.9.4.tar.gz"
  sha256 "c7cf8f45ba84b6b6114df7e8a4279f4dbdf8030c1dfa8923dc12f72ab7135d67"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.9.4"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "dcc98dc8d47328b16e41d42c224b862dbd4f38d9719f01f86d6a54404b008ee8"
    sha256 cellar: :any_skip_relocation, ventura:      "a1a21457639eaaa17721ba1ff0b566f4f5acad1d9fa790f02b1a5e20e533183d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f4980df11bdcbc8f448b7ee083909611d4818bd027e5d85ce1be513e5304ceda"
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
