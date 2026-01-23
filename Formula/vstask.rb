class Vstask < Formula
  desc "Run VS Code tasks.json from the terminal with deps and OS-aware execution"
  homepage "https://github.com/chenasraf/vstask"
  url "https://github.com/chenasraf/vstask/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "d9db88a4894bb495d861c35c4bc5041be76c14faf3a99fdbafb280a392b081e4"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/vstask-1.1.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "728f8a101e1c6f0afc0f0c7f37352e3faf12cbdcaa8eeb9bb86d4d0b6c5f5bd2"
    sha256 cellar: :any_skip_relocation, ventura:      "51fbc2d85f8e4fb01f3874db88da74b12d1fa227c83f72d088d0c2956264bb67"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5abace5d36a881b5ca59b221916393b38879ef7acf43a9e3626eaa2b4c25a790"
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
