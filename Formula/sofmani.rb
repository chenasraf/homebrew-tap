class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.14.1.tar.gz"
  sha256 "cdf9322ab5b35744a7ce0014239eb63d73622aaa30c2bc01ba24ea853b2f09c6"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.14.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a6816bcd81ebd2bb2aba137f9ce0f73deac9b6656898551a5342455cca15ac48"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9351b37e00b847d880b4102ca3eaadcad884fb8905707961a652ad02d395bf10"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d450ace3f45131a8261935a260cb33dc5d3365ea18bb6509d5b2031c9ac22467"
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
