class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.35.0.tar.gz"
  sha256 "be3898a9af46fd8edd10fc934ca901e11f1bc15abf82635f2936279e22a790fe"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.35.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "a98e927d2e9bb964823bd9f219bbcd891ba0769f8862a2a67da3a269872aeb85"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2b7c2776c508272f6daf1a88e14b85adb12937dbf00ea4392ae3a5f656cf1948"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "bf6b7fed71134e7df5b9cc59d3996d1235a0e5257c1c419a1183270809e9b4c4"
    sha256 cellar: :any,                 x86_64_linux:  "3ce177c35e1a1201ce4e73af07db17fd61faa86193ded84bdeb7ccf1b7cc8561"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "sofmani", "."
    bin.install "sofmani"
  end

  test do
    assert_match "sofmani [flags] [config_file]", shell_output("#{bin}/sofmani -h")
  end
end
