class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "7a488daa01d999ff2e1a310ce351e3d0d3add4e18c709625b61e7b67b554b90b"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a785b506d867cfa301970a02212b42ac1851e5033c35a1754d61c63717461ff3"
    sha256 cellar: :any_skip_relocation, ventura:      "5c4d19aa80dd59d9e716a512525d121da29dbef889d740d0a698cd958873b425"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "823b24408691c00d3010c4445e383c358d34d24c591b4fe40ba9b1965aee44fe"
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
