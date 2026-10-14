class Saveporter < Formula
  desc "Convert emulator save states between RetroArch, EmulatorJS and mGBA"
  homepage "https://github.com/chenasraf/saveporter"
  url "https://github.com/chenasraf/saveporter/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "472e9aa434014243876e116ac6f927728aef0931c79e015371b25a5568ee871b"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/saveporter-0.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "f75e39f73a8de5d4bdd723c6c93ebcaf9aed7bf1f445bdd5c06473d31449eb45"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "efeb9655a3d23b03e47a5256806c5e225175934caf4c6e85d2fba795d286ce4a"
    sha256 cellar: :any,                 x86_64_linux:  "ca43a0a65f21c493504e24e84eb3317bfd5bfa6121d2d46c28d335408fd54c98"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "saveporter", "./cmd/saveporter"
    bin.install "saveporter"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/saveporter --version")
  end
end
