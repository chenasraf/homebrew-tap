class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.10.1.tar.gz"
  sha256 "56388f3d1d16d48a5998fd0d78df93b7937f2e3c3fbe4aa8180484dd5d4adbde"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.10.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f2cc8e26e1232edd3e3402fbe702132204e4c223e0e508c564a49d286c743380"
    sha256 cellar: :any_skip_relocation, ventura:      "0f751d6635e97b280c72a79ce6f836f90d22ddd12fc0e7494b41af8587424bdb"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c1ff5fb4f44ee828e6d8ef8aea6caccc94280e2682e7b79edd44d2c9368a8d22"
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
