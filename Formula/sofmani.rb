class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.16.1.tar.gz"
  sha256 "d4d68f5d4ef22ba23e009d1218f7428dd2824bbf9d984e04c8bc1fcb8432076d"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.16.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "fe4d976ef5d9f1c93008075042877e91295d3dd2ce5158f42ec7cbf1b25b68cd"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "44597fd316400ce3b50e2fd00b5eb9058fc660f418b662d57040c59a72223f09"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bbe531156b103c847b1d273e89d7785e552d09bcd69ac98e1a692588d757c818"
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
