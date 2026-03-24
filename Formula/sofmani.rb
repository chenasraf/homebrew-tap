class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.24.0.tar.gz"
  sha256 "8e83355a872350ff2f5b2020fd841b523a81adfd2d8c5f699559857a151eb88f"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.23.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6e5842e20c6fc4339a1b8a8b683f44223abddf1539ff78f19f4a571b6496b849"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ed6443146c878ede7c43fc284cf7e66733562e050ae7c0571152c62fb0447564"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ca0ca98bf0078d660a3e554a8fd94d02b216ee2a5e0a509ba53203889ef2c7f9"
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
