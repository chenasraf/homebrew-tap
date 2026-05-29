class Wand < Formula
  desc "YAML-driven command runner with nested subcommands"
  homepage "https://github.com/chenasraf/wand"
  url "https://github.com/chenasraf/wand/archive/refs/tags/v1.5.0.tar.gz"
  sha256 "92dfc91bf187cd7c8026675bdaa50093cac3ed488d9f902f6dc404f232fcf9d9"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/wand-1.5.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "4d25b353e93ed39fc4d00a01a1ce0d285c91815a807b8abd5d746caf5b3944e7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5e4eb12f5d75c31803f51cca0798444196c91f3441695e5000e49aa9a1db5afd"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "cd2944946978823749d5de1ee716593310e5c4c00f6ee880f412ee175f2871f1"
    sha256 cellar: :any,                 x86_64_linux:  "ed7752adae1f289545327afa9c11c3d7096d23ec61a929496bf62762195ed4a8"
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
