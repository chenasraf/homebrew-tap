class Vstask < Formula
  desc "Run VS Code tasks.json from the terminal with deps and OS-aware execution"
  homepage "https://github.com/chenasraf/vstask"
  url "https://github.com/chenasraf/vstask/archive/refs/tags/v0.0.0.tar.gz"
  sha256 "f0eb5cbbe6765bcf59c7b0252ad209319c6af87a22ca3394b16e313433f7c055"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/vstask-0.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f0eb5cbbe6765bcf59c7b0252ad209319c6af87a22ca3394b16e313433f7c055"
    sha256 cellar: :any_skip_relocation, ventura:      "7b3a1cc3813bcf10989d62f0152e691d0bf90e89a91b4ce7db3b59e1a8dc0c20"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "505b7b89adca5b8305680be81f543149b0130f21fd1170ebde4cfb10d6efb50a"
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
