class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.30.0.tar.gz"
  sha256 "383351a80696e6b75773d6e1c3bc144983cbda5e7c790d002b8adf615146f8b1"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.30.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "99d7130229b815d50ad73fd67352ff1f2f6fa21982977a369ef41a278f0799ce"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1ee3192ab726c6d7e3f98e2701b92b9041f43451e548bac64080c095e7605560"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "6a328057f2f4bd18c31d4346eca445464ec06d1b05d8d3667b635559ede46c80"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1d93a79b906b8ddea9b499fe98b689f42e85468e545aac0ae5c524b1b1c18f5a"
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
