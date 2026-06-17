class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.32.0.tar.gz"
  sha256 "7099cc86881da59ba66f1104c8338f77dc86ff1c1078a5225d0ba58bef36f082"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.32.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "1a7e5203a505a7479befb473be42dc446a77f53e6f6fc67d57c36c963a56568d"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "861364bc553913f40b82bb3b6f7eb6692c0a18d037639b965a1755a2dea1644a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "b185b7a0ed57515a530c85caf3bb621dfcfb6b9482bfe6ef07100d0da44eb1e6"
    sha256 cellar: :any,                 x86_64_linux:  "302b79f6333e8a9ea93639d3875e5a40e9a1bd47f40f05a4fdf69d852b9c78fe"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "sofmani", "."
    bin.install "sofmani"
  end

  test do
    assert_match "sofmani [flags] [config_file]", shell_output("#{bin}/sofmani -h")
  end
end
