class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.27.0.tar.gz"
  sha256 "40e4a13a01d0dc20912f47cb8c2ec40fa0a902eef2d3f5d47c97ee9e7f7af415"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.27.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "14662f9c89d09aeb16f0d47251ec58c4d0e3ff01397fcf232c7a3b5d063c7b47"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "27f6864e68ec6b929f51a6cc74b97b31bd29c2d8262c31925c5626e61a43deac"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4b54d73ba4491056047780d44a13ec511d967b68f8fe5384fd16e2cde0ed6341"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "3a908d1b623bdc167abdc11c7441ba4edaf7991f1e4500c2d0b39904f443dc16"
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
