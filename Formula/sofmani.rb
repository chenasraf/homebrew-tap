class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "5107595098fe5a18971796db85e0e3f10176969c7de9c0760780b4eb41790b1f"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.5.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "91ac09ff91c04467ada3989b1388bc73fcadc5d4ee503e719a2bc6d5b6003fa1"
    sha256 cellar: :any_skip_relocation, ventura:      "ea6227b32d9d9d313b6da9cafa85ce30a2c150f26597974d03df77dc84e9e66c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4df690b6be477c1e34ed1924daeebd61775d9fb67d67b38b230c9cdf0f13eb41"
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
