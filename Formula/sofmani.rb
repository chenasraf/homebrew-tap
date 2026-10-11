class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.37.0.tar.gz"
  sha256 "fa88941407e4a16080625fcb3440731e5c17b816cec834b5253991bb2f02680a"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.37.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "8ef0df8691a61e9513109c4e0371886b8b40f14c8f661348e826298cbe04f433"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6e5dc4d7c3d7e8614c7e1325487df7dbbc9e7b53ec457c2bfdedcfd84a7ee71e"
    sha256 cellar: :any,                 x86_64_linux:  "f5dc2466e3464640d2b62ef5a9b5e62d9220d89f925b513df738e0fd18e29c9a"
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
