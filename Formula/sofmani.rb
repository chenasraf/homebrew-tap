class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.19.1.tar.gz"
  sha256 "cac057d52e588166964685f49c0fc39fe487f5efd39955abff58f2120db6cc98"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.19.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "df7b282a4d0a1d0686a92688de3395308fda628907f572845ffb9c1f5a92f533"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "7810da2c35bc58d962915106750bc15ddec1080b00da99b08afe9da2139d92ff"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "29742e21618f57f9109b94551775b6bb46ba7a2e925639511c3d82518839cf19"
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
