class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.12.0.tar.gz"
  sha256 "641f9cbc82bbadd45b2e950379a551bc85161d6b5b2e7cfed513cb4e4d35f95e"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.11.2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f0eb5cbbe6765bcf59c7b0252ad209319c6af87a22ca3394b16e313433f7c055"
    sha256 cellar: :any_skip_relocation, ventura:      "7b3a1cc3813bcf10989d62f0152e691d0bf90e89a91b4ce7db3b59e1a8dc0c20"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "505b7b89adca5b8305680be81f543149b0130f21fd1170ebde4cfb10d6efb50a"
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
