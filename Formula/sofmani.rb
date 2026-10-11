class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.37.0.tar.gz"
  sha256 "fa88941407e4a16080625fcb3440731e5c17b816cec834b5253991bb2f02680a"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.36.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b75b8abf8426714e4c19b28110b0ebde3fb569f97911819a44885d474f5e6991"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "154fd2a870880ff94d3ab3490f4f2c605c47dfae0c90627eb814065c8ac32f38"
    sha256 cellar: :any,                 x86_64_linux:  "613a99c255b635b618489e64c4a2a721fa50bee0383d2cf0aa7e40227d5f60a7"
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
