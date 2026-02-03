class CospendCli < Formula
  desc "Command-line interface for adding expenses to Nextcloud Cospend projects"
  homepage "https://github.com/chenasraf/cospend-cli"
  url "https://github.com/chenasraf/cospend-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "a9d46f54ccbd40927121678123ed6634f273cd81ae1de0bc01bfffd86e2463c4"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/cospend-cli-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "830e20fea26b32ca5a04fae4331b64434088a721ff6ca2cf2a96afcdb6d89045"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "ec81b3a37eb55329a8019eee3c9ff62950a33da2fa09b6fa3aac2fec240bb1af"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2842d5a391f802265e7946c00f65013ccbaf0914041307b84abf0fdc9ff2d7e9"
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
