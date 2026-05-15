class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.28.2.tar.gz"
  sha256 "dfb1d5616f15812058ae2db8d723916d78502892cf3640bdad63f9c653f84d38"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.28.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "df811efcd53e63a48e35b10710e71129cab886bcb897b7bcd3e0d028ee410e5e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a019416980aa9a9c2950fa974ff7b5a16e5ad701c334b100019aa54c89c2f91d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e7cdfebe5da23d6d8af20c4df30ed7928554bf45bc13528d4e178de607a4a30f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "fe11b1094200351ecdbb956455f3de85731a9bb4c254e4b13f5d24453d2caf84"
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
