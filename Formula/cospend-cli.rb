class CospendCli < Formula
  desc "Command-line interface for adding expenses to Nextcloud Cospend projects"
  homepage "https://github.com/chenasraf/cospend-cli"
  url "https://github.com/chenasraf/cospend-cli/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "ff7e6a29ba6b72e9e368a6e5c3c7dfc3d2fb00eb2cebc71e0f01e973497e31af"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/cospend-cli-1.2.1"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2537905f95c60f117de3c63b1c2398fbca8064bc1c6767ca6cdb638be7258d35"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "44bd3869730e7705a00e5e47c893bf1e5f900014beb993e1ace34c2fbbed5cf6"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8c1256f0db89293bcb6d30f6ce5bb6834fdd4bdd0c678f3abe1245eeca8816ec"
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
