class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.19.0.tar.gz"
  sha256 "5c98f1983c5dba778d89a9108e912b844a85f1e66d373c263afd6e9eb3ea1867"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.18.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f02b50e0fb0c432582b8a1232bf0a12bed3fd4e3bfc8a1b8e0295f64355bb2a3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "96a84102a44d6ac36872a44eda4e3261c503967874e72301183b4d54b3f52a84"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2c1b600a81b55662b799fa2fc93b7e7296f386469574c787051833d1a77e4e9d"
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
