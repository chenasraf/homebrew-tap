class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.36.0.tar.gz"
  sha256 "e917c67e3eb0a1e07c8dfb9ecd9a6110626a2e415d51e516a833ead5a9788d7a"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.35.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "34fc5b50b4249b71ff949fc8b6c2f46dd2c684633211160c8a20516020e70e0f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2329d0b8dbb9e9ccb1899e46b63c7a881dfa51552edec510d84f8ca42b7ed3e3"
    sha256 cellar: :any,                 x86_64_linux:  "46191e060b1f7c715bc977ea61dd974d9f5ede1ae8e079e2da93f252d16ce1c2"
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
