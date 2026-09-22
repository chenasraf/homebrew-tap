class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.33.0.tar.gz"
  sha256 "d3e8af96d38e29c40c09dc38d74cf31c2d4f59d7b1b40e89304f4f9f79f071ad"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.33.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "f90828b1b07f3a2e610fa2f19d4cd3de34d58e8da943069673a992281c267efe"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0f3123b02e5d42f309a21914c0f01261d691b5ec518b8ce928a4beace342c4f7"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "67c8927dc4ca71413390ceaa6b7c471eb13f47c9a0aa1a220d89d0c8588ab421"
    sha256 cellar: :any,                 x86_64_linux:  "a73c45554443b91e4c472214f2e12bb9cb76dcae60c5fcf343f1eb4ba3268fe3"
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
