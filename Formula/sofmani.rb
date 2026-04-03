class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.26.0.tar.gz"
  sha256 "14eac59bf2498512bfd7ffe4802ac194433e73bdbb8f8ffa93a8755d22ed0583"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.25.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "f9424879890a24980dae7e1ecaaaa7e73afdb80e37ac4f678366e69accbca6df"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4ea426098b71fcaabd3909a36615dbd20574a4045e5bec459d29ff1910a476ea"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "54217041aeea18316711ae047b165367146174634ad349d13d3f787344634a0d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "44d01e8f86fc46e39cb269b94056428c3ad02e1b9cff59273ffc48a43a280838"
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
