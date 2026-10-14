class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.38.0.tar.gz"
  sha256 "007addd3d2552b16f538249a67d1cd9d84834a920ee95335ec2fd29c2dfd859f"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.38.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "3a03dbf3e535de513333b199557030ab7477796889467efdd8108cda0a44a9d7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "47f54ae76166bc3e0f724b257bc30181f54b188775197f848c75e3eec5ab7d04"
    sha256 cellar: :any,                 x86_64_linux:  "d24b3f07cb284ccf85abcafc1bd7a415e6fbe53a60523f4054de612e13d684b1"
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
