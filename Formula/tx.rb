class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.3.0.tar.gz"
  sha256 "faf490568f901167a04d06b7fb1e285922d92818e03935650976c1370deaf285"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4fc900c87835889eff78d6d824741970f187d0bfd0de9800bffd6cf6fb316f36"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d17d6a227dd4a14e210c09e3d48c9b0aa6e685d61ac17b34fcf9d6b8b9515338"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "6d0fb371a055ebcfd4c1f4fdadbdab9c3dd3687aa62bc8c54d7162e77b99dafd"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "tx", "."
    bin.install "tx"
  end

  test do
    msg = "tx is a tmux session manager that creates sessions from YAML configuration files."
    assert_match msg, shell_output("#{bin}/tx -h")
  end
end
