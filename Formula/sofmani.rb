class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.9.0.tar.gz"
  sha256 "0981aaca622886999a01b96125a22066249258c38babac27c9d6afb6f9b75eda"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.9.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6452e55590d1417844df1b9c6be9efd6aeaa058821569123045729aae1f8a886"
    sha256 cellar: :any_skip_relocation, ventura:      "98246cddfcf913bd120a5c3909cbad126f6cf9c5feffc58a1774788cb97577ed"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f3ca402d516f003c9ce09e739590b69bcdea09e6417f6b47c7ad5bde84812ea5"
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
