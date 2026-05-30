class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.30.1.tar.gz"
  sha256 "8ea6a3611ee91364962358a6e378ae88474402392115cb4691728e9092053ac4"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.30.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "a7ac6f72b6c236d3405b1d4be7eb658180d9a7d0089e57faf7f0e16c446862cd"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "7365beda21c7b3af004901d5dc5f8d4129dbc62f0e569393bd5ed102d011f5d9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "b592834a2d7635ba64c3cbfbab64cd3ad3fbf2a9aa38097687a9fd5732cc5447"
    sha256 cellar: :any,                 x86_64_linux:  "568ada4b3c22da93eb3b48e5e60ed2c0152a95a33b10e3d33a177555f04a5e7d"
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
