class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.26.0.tar.gz"
  sha256 "14eac59bf2498512bfd7ffe4802ac194433e73bdbb8f8ffa93a8755d22ed0583"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.26.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "a6d31780f578eeebc268d0cf67a2db0906bdb0318df77d272c606b2638eb6a7a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "80f2a9f9e3e419afa6208e719aeb242ff64c7eda2675c0dac80fc1c32bd403ca"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "6ce9c0dca0428d8027ed5c29b135db1406da816220c7ae6d96950c803097edc5"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ebbf94442b5529b11e9b2714a0624a4560ab063bc903785489dc5b475309e4c2"
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
