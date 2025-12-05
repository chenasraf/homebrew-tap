class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.13.0.tar.gz"
  sha256 "2563984ff2afe549b6c477ef6d808ccac31b19562b3856fabe6a8857d0a1a060"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.12.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "24a1357db161c550abe44e17c484dc5c2d5df4e2cf8d5bde065c20d3c4355e77"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e8574c846ed5489f9f93f5d4b07e3f6321dde2d0b4b5e8ac95c1fbfb767631fa"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "98d282093ec58ec0c85cde7983ef4064fba9276f9bb72ca59f0eb5df2bf2142e"
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
