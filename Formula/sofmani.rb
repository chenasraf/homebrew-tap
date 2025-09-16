class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.11.2.tar.gz"
  sha256 "0bbb4d506256413dbfb899ad61a3528df5cc9a58b94f957a7ac4dee500b1936e"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.11.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "a7f3d20439781f5d2468dbfe384940513c6ece797c8089f242c3782de464b350"
    sha256 cellar: :any_skip_relocation, ventura:      "118f60f668ad7bad6b6020160aa6a2d2fc7f9d3c7f4cba4cd771297d0dc671f2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d7490924b8483bbbee3e841848314b4a58a4fcbcead269c5d2adff37be3656de"
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
