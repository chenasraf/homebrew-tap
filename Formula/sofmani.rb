class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "dbcff7be54ca89c282bafe253717a2960770bbb3a5820b7b95bd668ccca8297f"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "4941252086eb62660b684f1210dbec8d9bfd7a343f2fca43a8cc19dee64bb38b"
    sha256 cellar: :any_skip_relocation, ventura:      "7b7c96d587d956219f30089af88e416adfef5b039f2f844b241a766d6e8016d1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "39fd3e306f66b7c04a3abe0e8e5dbe2070ef9c72fdd1bdefde2a1807d22082ae"
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
