class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.25.0.tar.gz"
  sha256 "382803f735cfaf65df59d15a9b544c5170f1e75c341417c2a1801e96866cc7de"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.24.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "a380804ab96af021e22d0130c1ba6108c9ddf045f869b554cebb0d5ab9922ba1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4d7bb83c9f6f733ea64796d45559f720e905d34c5a325dffa6ef15c9b0acf283"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a244aecc9c813e53e9f3959658c88fbffc645f6b096c2b634de960da624e6e30"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "57783b18134a89562ad26de18a1af60e79f5c76f9f7225378ac1cfb2755f2556"
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
