class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.32.3.tar.gz"
  sha256 "dc1d6ea0ac725b7006bb909d1be5808c5e6c7ee28fa3f4d10156f711941f7ed3"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.32.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "f80a3bbbd79eab9a9e1847d7f978eafc7ea43520a0a7c0bd518877b9a5de4257"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "83d34db1debc39a6a1dc9be296b263bcebb4c39e3237e368918bf7ed9022c43c"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d22b25f72ca55e30722bc6b821e63280135896fb703cbd27133275d5afa33b32"
    sha256 cellar: :any,                 x86_64_linux:  "5ec9e38b3e07820403d038d395713f0ed567165bbe5c49196d2d0341d3e57aac"
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
