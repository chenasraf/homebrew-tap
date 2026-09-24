class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.34.0.tar.gz"
  sha256 "9c647fecd1255a0bf256b2b5f4d3edaf7df51f2fdc5cdce58c3a656cdd18979f"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.33.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b62237550b47015c09eee34375b4cf7eb21251a04c406026e8c6fea7dd2e052f"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c7063c3c30b8d8f39253e72b6f69be53009b88e07b84c5dcc18fe76de4eff734"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "93b2d0d9c9dc9acf92a8c433d5090f7bc1d7134b12fdc2feabd05fef6dde2e8e"
    sha256 cellar: :any,                 x86_64_linux:  "eb66fc3ad8d253a4d22abe6b8e442cba17e99d15e3a60fe9f4260d0eb83e104d"
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
