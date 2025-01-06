class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "e2e35efb31d068ab80c6f5d63514926146707b3033ab7ca881aff31665bb9df0"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "6dcc9a65896d5c2256a29d9f429500cc6505d1c98f427abc4cd333a867fcdf47"
    sha256 cellar: :any_skip_relocation, ventura:      "637d31b7da72e0a797b3a30d50ee531b7559d5d13c28c7c84489adba72f78234"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "46cd6bff116a56f342bc946919bafaa563500c9dc454def1fbdfa5e18ab25511"
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
