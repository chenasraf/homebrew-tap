class CospendCli < Formula
  desc "Command-line interface for adding expenses to Nextcloud Cospend projects"
  homepage "https://github.com/chenasraf/cospend-cli"
  url "https://github.com/chenasraf/cospend-cli/archive/refs/tags/v1.8.2.tar.gz"
  sha256 "84010c4343633742cdc200f5dabf37dd830b2bcbe70624f57846a7e3aa337891"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/cospend-cli-1.8.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "74dbfccfac8ca13af80a185a6010a50cdadfa3d1700fe0f016c3da707092648c"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d3cb28005e90110f4b423b0a17a478f7a0a6e5fcc6aa364f8ab8921a4cb8868e"
    sha256 cellar: :any,                 x86_64_linux:  "d26defe81e3ec6acf77c682113c81e0fb115e1d13bea46a413abcdf852652696"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "cospend", "."
    bin.install "cospend"
  end

  test do
    msg = "cospend is a command-line interface for adding expenses to Nextcloud Cospend projects."
    assert_match msg, shell_output("#{bin}/cospend -h")
  end
end
