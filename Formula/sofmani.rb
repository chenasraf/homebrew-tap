class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.32.2.tar.gz"
  sha256 "5d537500894a72b6cbebabd9b4e0d25e180d01dba68a096750cb88291c348784"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.32.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "fe0dd075e6e1579483552db78ff6dccc2a566d02a994f1b198fd783058819d44"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f6001920f562e0ce56f12900c1d8279cce8a120c8aa71a658342de6f450bad58"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "fa1985ab9f8ee2055ab0c0077a19bd58b2ebefcdfc2028196bbb1c215cac5d1b"
    sha256 cellar: :any,                 x86_64_linux:  "e67ed1f6ec95dafeeded337c2f6e268705d85ad088e9a5ef0ae98879e37b88c3"
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
