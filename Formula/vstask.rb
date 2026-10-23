class Vstask < Formula
  desc "Run VS Code tasks.json from the terminal with deps and OS-aware execution"
  homepage "https://github.com/chenasraf/vstask"
  url "https://github.com/chenasraf/vstask/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "a53ff53771669e38df8aedeb5cdf61babe0c22845c6172343dd368712f0110f3"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/vstask-1.4.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "2db487892794bbe8048120ea9559d0b8795f5792b3f152442c4fb932d4d4285c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bc7a25e306cdac6cf60ee349aa0d52bf2b41474b6c06e73a55f61ee882744e91"
    sha256 cellar: :any,                 x86_64_linux:  "94e52e5d6ece4d66f6b5674c133dff9e5d69beb51b3d1f25d11d1df81655be4d"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "vstask", "."
    bin.install "vstask"
  end

  test do
    assert_match "Usage: vstask [task-name]", shell_output("#{bin}/vstask -h")
  end
end
