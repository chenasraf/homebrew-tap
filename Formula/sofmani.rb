class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.15.0.tar.gz"
  sha256 "a3d6e21b017419c181446631f537b7ec758a0242b68e0506ae536f13b0550cae"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.14.2"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f0555843097ee342e98cca8b483f951da4a7ae7a9b6ac75f3355663f68147174"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "856efb5cf15a143aab416e7530ddae9c9a2fc476410a10877eee22b905d06336"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c76db416251d146566cb38c4b8fc4893c354e6a6d230c91f1f194eb07e06a3e0"
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
