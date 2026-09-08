class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.32.3.tar.gz"
  sha256 "dc1d6ea0ac725b7006bb909d1be5808c5e6c7ee28fa3f4d10156f711941f7ed3"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.32.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "ba26f0ef59df62e9a04aa95057bd59fa13a40da19d7c684ab5f8447d9e8311f3"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "75c20ee3ace3f6b81f3c4817b91c42170ca552dedcd76ac496cc844f907fed40"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "b301d186c448a77c3efbe97182c05cd8b7ae6d835b3c4eba367991eff8177117"
    sha256 cellar: :any,                 x86_64_linux:  "77175b1814d4cf4bbd894a48a77ad04a9c5f8587c6f957a6624cc874e0aeec3b"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "sofmani", "."
    bin.install "sofmani"
  end

  test do
    assert_match "sofmani [flags] [config_file]", shell_output("#{bin}/sofmani -h")
  end
end
