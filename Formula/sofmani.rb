class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "5107595098fe5a18971796db85e0e3f10176969c7de9c0760780b4eb41790b1f"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.6.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "db57f8eabd585dbcb0dd64d3540ecb9d3c2efcebff0f8ca20c9b87026399bd41"
    sha256 cellar: :any_skip_relocation, ventura:      "ceefce1f41b6446b39d5e2cb24e3a7e157a9157c30256456f332f1fb989d2f58"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "492b000c6523f38ccff645fcc68ad31ad19ab3bdefa12883f5f0a48a71a6179b"
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
