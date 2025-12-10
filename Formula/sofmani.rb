class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.15.1.tar.gz"
  sha256 "f6838c67d528aa9b334b265c3c1a4db71d7cc529f60717b95bfae2494365b621"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.15.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "59d244d6c143dd54528e77eb4165fb69b7069b40a2e3cfb2383086d402a52695"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "f9e26872cbef387e698b00e484ffa7241a3a9c1d652b65d19e40b7da03323365"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ad49fd71a8da84cd95c1724b4c7dbc202c8c4916841ae3ea59614bc319c48d54"
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
