class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.14.1.tar.gz"
  sha256 "cdf9322ab5b35744a7ce0014239eb63d73622aaa30c2bc01ba24ea853b2f09c6"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.14.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8424ebf9cc304c7cd4c8aeae5f02fbf2ee0a9b7ff3d64a8b2502a797d4974040"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ce41ed2a5abc25eb8ae843cef38942055fc84cd1d3acd7ded103bb9c7cb837af"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0c591be425dd07636b44313b9e049ff8612616d59ded9c070fefba5b133afb2c"
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
