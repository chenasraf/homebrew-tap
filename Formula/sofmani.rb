class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.33.0.tar.gz"
  sha256 "d3e8af96d38e29c40c09dc38d74cf31c2d4f59d7b1b40e89304f4f9f79f071ad"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.32.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "97a1533f0184ecf22659b04d3ec9620e9ad03851dd9860428283a076fa6adc6b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3488f245478c90cfaa1829ee3c57ce13f291e39db6c83db9c19598a800cc0f60"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "e3273b4a028ed48f7703ec7b532ccb7ff27885e04dd3199267bf03abc787848f"
    sha256 cellar: :any,                 x86_64_linux:  "6f2bb8cd558809617276cc0df19ffb1365f71cd582c75bc845c2a5b0ff202a57"
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
