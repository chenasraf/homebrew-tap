class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.38.1.tar.gz"
  sha256 "740685bf7b22c9442f89191baaebd11b22794ae0ff67cec743688ae375b7452c"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.38.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "a5d354f114478c476121156e8cc02667620fc88e6d8559b521d709a08321e646"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d70678818e9c37e3ed47c71e062af80509d7419f679335000e943e7f4da73856"
    sha256 cellar: :any,                 x86_64_linux:  "fe9bfeb99e4ad566601e56b1e56dffb80928045337f501448f0da28413cfee8e"
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
