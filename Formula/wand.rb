class Wand < Formula
  desc "YAML-driven command runner with nested subcommands"
  homepage "https://github.com/chenasraf/wand"
  url "https://github.com/chenasraf/wand/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "7bf68e6b4d6058a4a7c79fa26d13b5287af059e8296e7d88b0adbed5128ddd74"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/wand-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "8cf921826ee5389b302907e2ec7bc44e17478eebe48be0189ee66d0e64dcd142"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "325d90ab2017a5db26cf1ec68b240cce4c96c4aed24d39852afca1f41f7791f8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "8c9f8f80524870a1f4b5400e60e4c20152cc3eab91bcedc60d5bc64691d761a0"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "db11df0f641a0501ca172902406bee7c6be4a6347a8f3b72a47abb23df7fe320"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "wand", "."
    bin.install "wand"
  end

  test do
    (testpath/"wand.yml").write <<~YAML
      main:
        description: A test command
        cmd: echo test
    YAML
    output = shell_output("#{bin}/wand -h")
    assert_match "A test command", output
    assert_match "Usage:", output
    assert_match "wand [flags]", output
  end
end
