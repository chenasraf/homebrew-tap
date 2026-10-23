class Vstask < Formula
  desc "Run VS Code tasks.json from the terminal with deps and OS-aware execution"
  homepage "https://github.com/chenasraf/vstask"
  url "https://github.com/chenasraf/vstask/archive/refs/tags/v1.4.1.tar.gz"
  sha256 "a53ff53771669e38df8aedeb5cdf61babe0c22845c6172343dd368712f0110f3"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/vstask-1.4.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "aa257861524234cb828472277d4324290cc255a315ea63b1d919ac7e08a155d6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "94b1397375da6f316ad9db418b5d7747808c4e29c1937d1fabe6354443e1829d"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "a60b9576c0eb533c9f78ec0a91bde4692c342837def0783ccc7806abc74c28da"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "vstask", "."
    bin.install "vstask"
  end

  test do
    assert_match "Usage: vstask [task-name]", shell_output("#{bin}/vstask -h")
  end
end
