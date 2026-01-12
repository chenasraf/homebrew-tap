class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.16.1.tar.gz"
  sha256 "d4d68f5d4ef22ba23e009d1218f7428dd2824bbf9d984e04c8bc1fcb8432076d"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.16.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ced5cb326c16a7a3b82bb898774f4cedde395c754f358bd90e7bc9a0e573e3ea"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "3868d26c29ac86bdc17717b3e7f86d0f4b38d80e331221b7f547644d87bfa7be"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "d22fb541df5157dc816533b077fc4b704b9974fdf6f6c0f908293fae2a0507ba"
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
