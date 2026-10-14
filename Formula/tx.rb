class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.8.0.tar.gz"
  sha256 "96d2f7e0802c4a285cbd7bf8e929ecb7beb2954966e283ec753db1e6902626e4"
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
