class Vstask < Formula
  desc "Run VS Code tasks.json from the terminal with deps and OS-aware execution"
  homepage "https://github.com/chenasraf/vstask"
  url "https://github.com/chenasraf/vstask/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "94b0d6d3e196a5e1bcebdc834a8ebeeb7c615a7f4d0714fdbcb46da9911123b6"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/vstask-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "7a6cf8b5b1b0166c2b0d945b571336f22803967e94bb6eb96536be661abf42ed"
    sha256 cellar: :any_skip_relocation, ventura:      "de076ba1c9c62d9277858a9f215cfdcdeefec8128c702017016e6c0f4a86c835"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "58cf5ee6eb3454a9c8090f841511b3f2448ad54b16e12f207893a669818c8a16"
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
