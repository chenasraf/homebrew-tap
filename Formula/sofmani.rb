class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "210bf6793368c82b74792fcdaef4f4472e89f53f02fe4567e04c5ed791f2b9f3"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.8.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "d9af137e2e8992b4406750a4dd9cb534028efce69d634addbc845e7b174173ff"
    sha256 cellar: :any_skip_relocation, ventura:      "8e6eb63000dc2b9dc8a32c9a35745c225a5e0abefc35e9bb16230dcda06c23c5"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "bc0bd20910c436ccbf4a551a9e79a6c25bbd3a05d41ad0debee0a1e63ecdbdc2"
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
