class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.9.3.tar.gz"
  sha256 "ef53112c0224a12a04433f1bfcdc509a13f08b85bbc1575b60002f9ecffbf7af"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.9.3"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "8bb7ddc3105e9922edc81bba1f79351080dbd74582050aef13e713fed3e6a144"
    sha256 cellar: :any_skip_relocation, ventura:      "edda118d648dd240db0999a0fc3623f0a82a77bf288d4578e5ac383ccf6a872e"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "763d95a19dbecab35fab11813c6810e59be4a179698de9391a71f6d6a90c529b"
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
