class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "e2e35efb31d068ab80c6f5d63514926146707b3033ab7ca881aff31665bb9df0"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "600d9cff7664b0c3c1bbaa953367eef4adbe7048f265027e3b6ef3f03d86ba37"
    sha256 cellar: :any_skip_relocation, ventura:      "b8d0ec597bc51ed2e96a7d6fda70231ce3b0fcaa431d780ba73177e1441d7c4b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "7b0ea9ed609d7b1ad243f1719a68d883326cf20f3f87fb2165342b1d42e37330"
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
