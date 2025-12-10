class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.15.1.tar.gz"
  sha256 "f6838c67d528aa9b334b265c3c1a4db71d7cc529f60717b95bfae2494365b621"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.15.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ce3f627b4fae641774ea35959731522de3e5cfc48f302ce87e3db4adc0388628"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "07d650424f908937e591f13cd1d9ae9e38b7ece57e10a2d012cf9eaa6650ca05"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8f6ade622c5d42b78fa6422cca4da1732a65f13d2b8f2393962f3a209b54dfd0"
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
