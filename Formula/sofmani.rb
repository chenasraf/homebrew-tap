class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "e0fb35542efd94b5b828c97f758ed5d4b4a9282ac9e77ff2afcf59a3f41a9076"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.0.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5a1ae024eebdd687df399b888b20f6e01c107739cf4dd80de78831c355202258"
    sha256 cellar: :any_skip_relocation, ventura:      "b28e8a5a94a54d0defa2eaaf11a0943ac26bf8eb53fb0568ea1873044ec43449"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f5d2534d9baa97f9965dfb25924d1b468af639b7bb2f4fa73efe4470cb348392"
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
