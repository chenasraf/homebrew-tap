class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.11.1.tar.gz"
  sha256 "5d61741b31b7646770dee1f4f5e33f7f24424daf50dfb091305128cb84908004"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.11.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "2deaf4337d39d3314333bcc505f018065bc742e174da93cc69b75bcf5bcae86c"
    sha256 cellar: :any_skip_relocation, ventura:      "a6a8240fcdfbcd71d659bb6d504fd97e4749b19cab8191ae49e9752497b36f35"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e56e036dd8bfe54deb789bbc849f5c574a742e3e70caf1d8f4089869af294fa3"
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
