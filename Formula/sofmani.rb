class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.11.1.tar.gz"
  sha256 "5d61741b31b7646770dee1f4f5e33f7f24424daf50dfb091305128cb84908004"
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
