class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.5.0.tar.gz"
  sha256 "7125de227dad157205dc24014a8b5655112b70b91585c0394bc446156e57716f"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "4ee4318e7281e5ea326e7ebbb1b6bfb2223904346847c7f05dd33fa6b6ef1ef0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "a4d30ca3d5b94fdb3b096c48ab925fb383f8c412dabeb5796fafe52f98cdf462"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "1dfea34c8ad3e69f0464f1cff20cb9291da8ea3c9dd5588713171081a2bf38b2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c56ce4b4acd811c38a426c190d8f6bc7901f59736c2fc3e7b05160aae7495c6e"
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
