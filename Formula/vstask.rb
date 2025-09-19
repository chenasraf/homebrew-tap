class Vstask < Formula
  desc "Run VS Code tasks.json from the terminal with deps and OS-aware execution"
  homepage "https://github.com/chenasraf/vstask"
  url "https://github.com/chenasraf/vstask/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "94b0d6d3e196a5e1bcebdc834a8ebeeb7c615a7f4d0714fdbcb46da9911123b6"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/vstask-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "b92801480c5a90014de4c4fe1ac2f0dbc09f684e12c891e46581268d2cffcfb8"
    sha256 cellar: :any_skip_relocation, ventura:      "7254947dc610900a05447e70002753867b98cc5fa28cc4068aadef23c5d22a20"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1796545af93e3bd49f748f8b92d01e3956e3647b787ba1cd2ef3664f99b468ac"
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
