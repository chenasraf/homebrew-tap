class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.20.0.tar.gz"
  sha256 "e6863da6882ed0dbc4172c05440a24e35585d8a681a3bacede8ccf11f62fc9c1"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.20.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "393875f010d54eae5c3134f3b2fa0af7fb2807942a5c6e4aa4b941cf37660fee"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9f6d4ef89461f7db534a6402e56bd14fd0ef304627881aa5e677be678ecc7c5b"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fb42ab0a1f83882a1dcc999261cf1e23dbf00694cd799358456550e2e1983612"
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
