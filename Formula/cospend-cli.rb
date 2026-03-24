class CospendCli < Formula
  desc "Command-line interface for adding expenses to Nextcloud Cospend projects"
  homepage "https://github.com/chenasraf/cospend-cli"
  url "https://github.com/chenasraf/cospend-cli/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "25b6eb3c07a3b662cdbd14542d4a139d76b867f5991e54a161444b7cd27bd4e4"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/cospend-cli-1.8.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "b2527c1f086f31a964852c1f3bbe578284157155ac72a2f4505997ca7926177a"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0afe1ca1b273f22f49f4a81224b5da7188893fd758b65267e0c2c4c9321bb795"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "d978ec06931eac3a84ccbb8b0af0a4fb29327a8a034afabd8d99446d2255f029"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "19fb02d0975cfde0bfc8614b5ec16f3f1f5b9e88987fefc429c066e5528ced18"
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
