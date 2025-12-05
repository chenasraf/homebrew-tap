class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.13.1.tar.gz"
  sha256 "47f3b08b84ef555fb20ed92c2d976b8e3c1ebd9b86243b6d4f2c6e20f7120529"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.13.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "be518ed4b8f552026af466fd51663369ae41dcd03d2ee346143e3684f3bb9121"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "94fc842c23a902548279dfb6ed38bb455e50818947512b3965c580d69f329c74"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e472ba4053a20a570d02ebe90fca1b2b0f2bb11305d6f99b938f24d57bd19e9b"
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
