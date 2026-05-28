class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.5.1.tar.gz"
  sha256 "abbf9436936b4278947e2a4eff626b1deac4bff2c1cd320d392547e54cd43c6c"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.5.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "2717d1907d6164c34eae7a4781c7335f1236f562a66095461fe715aaf2749ee9"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5d3b457eec3df2c5432b6a085e6487451eb6516d7b8a8044bb81c3cac5e09d8d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "425b10acd8fa5728f2103d244a0a2eca843a8e89e56e2e6b57f549c2eef505b3"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "9f847a89c6a7e350c2ee1ee38552998a7e902a4a3d63677e35d01dae86b0b2b0"
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
