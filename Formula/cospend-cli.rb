class CospendCli < Formula
  desc "Command-line interface for adding expenses to Nextcloud Cospend projects"
  homepage "https://github.com/chenasraf/cospend-cli"
  url "https://github.com/chenasraf/cospend-cli/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "f17a53f19421fb4fa3ae76c3ebdc418b477c1cda8eb83c31b494897d55547445"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/cospend-cli-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "c70775bb59738f308c64d6ee2b3eec1e52632f02bba6abcb9de68ddec7a9ef78"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "8a547b5af4898a1e2f19116e684e0df9a2ddbfdf2725ed35fb758122d75f585f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "910a22a7a2cefd41fad6a7981415cd7e6ef6844afdb1381e19daf0222456408c"
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
