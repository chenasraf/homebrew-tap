class Watchr < Formula
  desc "Terminal UI for running and watching command output"
  homepage "https://github.com/chenasraf/watchr"
  url "https://github.com/chenasraf/watchr/archive/refs/tags/v1.10.1.tar.gz"
  sha256 "1b6afeeebcd728f19f794f17d4824a27302ce274eb380c1f4c6812131cfd1337"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/watchr-1.10.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "fa06219a3366e0bd5461d4725b4383d638c5acd110af59684e0dbd39e663f75f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "6c675d639c0e7a43b2bf9d118891a28f37a52252baa6be3ea94989b0cf8b7b28"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "f3fbe693eb8d4492563955e0a11b31ca3e1cc2a46b08cb102ca81a6037dc7342"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "9de2aec730e060488fd9a4b037e47a49c8afb100705523de3457089d258fe8c0"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "watchr", "."
    bin.install "watchr"
  end

  test do
    assert_match "Usage: watchr [options] <command to run>", shell_output("#{bin}/watchr -h")
  end
end
