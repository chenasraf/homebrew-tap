class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.22.0.tar.gz"
  sha256 "fa1eb51377114a58fb25d7da45e3a6a8488044700cc727a6c9f57e240a1cdee5"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.21.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "57dc5fca7e84d1664f933aeaef29ebd16c0a50b06d8b8bd4115a12f0eafa43a0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "73d1e4be38ec40aa4a03d54377a76f6e436d94b83d54fccbf8eb192103305d86"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bdcbfd16bf46d9c3998327d3dc4d761017cfa68c448e85cf76614d2f2d5b8d89"
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
