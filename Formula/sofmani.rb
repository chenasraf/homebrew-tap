class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.28.0.tar.gz"
  sha256 "f0eb75dde78f9e6a572252b07f1fcec9da84fafb1d8b5a50567bdd154544db1b"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.28.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "e085e419442de50436f7a7ed1fa3e627aae5e04363910e946c4301b4a72ea2db"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "ca4dbd80d17720b2b8e86bca48b8566c30e0513c0e353e57279ceac488f78bfd"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "960ed56dcd312b873ba5bb516c4cbff270e6269c476dc17ac1ade060910d1d9a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "0c32aa756bfae47a5e774902b57f67aa07753fb9ba66d11382023f90becaa9aa"
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
