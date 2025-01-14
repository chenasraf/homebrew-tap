class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.4.3.tar.gz"
  sha256 "d2f636d2d4b63f332d8b59b3cc0fec8da3a7540d494d334d86a7af0a407a5cf6"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.4.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "bcec1c47a030b7e58989a0367ac9c73792ca1cda8446236dc007dd47f82f9a73"
    sha256 cellar: :any_skip_relocation, ventura:      "a92c6bb6d023cff34c9ad605a6f1311ab706cf7e9a3746b73c0e0a927f4ae96c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bd8ce0a801d20d841a34f1a3cb0fd47f4db9f0455e3f2201464db3b566a8f7da"
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
