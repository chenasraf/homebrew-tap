class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.13.1.tar.gz"
  sha256 "47f3b08b84ef555fb20ed92c2d976b8e3c1ebd9b86243b6d4f2c6e20f7120529"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.13.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fa33deae66d099637acc2d047a267c37fe4ddf8873904cb42d0f956540c8186e"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "15ce4b4acdc272bf083a504e9ed450f34d611b821ba442845d2605c9da6399a6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "9a7152303fbbe0569c09b4fb48951d3f316e7baea85469c1a145b4e0d78130b0"
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
