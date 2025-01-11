class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "dbcff7be54ca89c282bafe253717a2960770bbb3a5820b7b95bd668ccca8297f"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.4.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c5846052c8134d65d85faf19c17eb1622597aece17e768ee582a527694201dac"
    sha256 cellar: :any_skip_relocation, ventura:      "80bf5535391201ecbac9f3a1e42cf2601991d845419527236d600b4232423ded"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f4eb25f08faeb80f8bbeca03a32aa382ca12d617d15c51f7fcf635e5adfe6a26"
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
