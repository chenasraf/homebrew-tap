class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.18.0.tar.gz"
  sha256 "86ad4da816a005df9e84306ab8d9e08f51f68bb7e3f7c93e21de1f84486f3fe1"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.17.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1a201f8fec6918a3f33ed2148766b437a50aa5e2c940131ba2a1b52dac801f2b"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "3764ea590a9719cdd974b4f64fb4f78d4a0b2e52f8fce4d67bb14fc049df36a0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "524836d8dbd71456e8a24b10ba349591e4432dc4a381a6f0a1319d31bcdda097"
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
