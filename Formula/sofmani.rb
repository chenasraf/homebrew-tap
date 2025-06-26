class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.9.6.tar.gz"
  sha256 "ec1b7beac12f9890e5e7ea553af00b061528aac788ee65bf933de520e1cff90a"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.9.5"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "5e228e3f8bf392a079bc460e05d9a1f74daf75196ab51b8594aa4af0b694e87d"
    sha256 cellar: :any_skip_relocation, ventura:      "80fecee5da9db496ad29119f02048bb7b2662366bd8d90d4442ea087612e81f6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9314399bb0665ea794b125657eeb21110c7754cbcee7de8ea99690bb2099f1dd"
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
