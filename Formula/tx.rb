class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.7.0.tar.gz"
  sha256 "ec89c7e1ac6523f50d39ddcbf5a1d727912b62e2b9eee327fb35b4b26374cb55"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.7.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "261b6c1038335bf5c80260680f87016cf8accfe5c479815ca0b09d804c207920"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a27f15ea15361410898eea5de1f064456b428f61428d50bed604f5ab4b34ad51"
    sha256 cellar: :any,                 x86_64_linux:  "d1088e7abd1170a7d55d6d880270183b8099bb515cf58b4d542862b6b279a16f"
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
