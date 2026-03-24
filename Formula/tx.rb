class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.2.0.tar.gz"
  sha256 "b58cd41911a27958889c577bc51a57b1dca2fdc4dc15f377074bbd4750c60c5b"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "b2989e9a32f522f22721eb48893516888c5d9d08ec96d398cb04454d2a59a1f9"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "c72757f651789ae389846aaa4999f28e99f3cab8d7cd22c5d641fba7a0494602"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "47c136aeeacbd87d4ced4f185ad4c26b8852e8b399618e54cc73402c4e9f86f5"
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
