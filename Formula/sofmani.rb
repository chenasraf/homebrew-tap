class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.9.6.tar.gz"
  sha256 "ec1b7beac12f9890e5e7ea553af00b061528aac788ee65bf933de520e1cff90a"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.9.6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e5c8b2ccdeef3d5321df3769c54769463eac6b4ef233711779962a7f63386a9c"
    sha256 cellar: :any_skip_relocation, ventura:      "bbfbbab568c0e656c7992e83abc64e62c9fc20bfbad1d5ef3196e41e82b443f3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "12648dfee6cd8ce508d4f7f65738aadf481d784894144611e0d0f828b1c5676d"
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
