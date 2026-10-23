class Saveporter < Formula
  desc "Convert emulator save states between RetroArch, EmulatorJS and mGBA"
  homepage "https://github.com/chenasraf/saveporter"
  url "https://github.com/chenasraf/saveporter/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "11f797edbb347945bdef2d6baebcb31b13c01effc057a8e1c25ccf562f87b484"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/saveporter-0.2.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "21decd76082433a36d4669bbd922d81aa673fb2367146af1eadf7ee9d0a41770"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "db0dddef432ef4dfb498b22814263aa808c01ab9987d02b3192af9e05e7af3aa"
    sha256 cellar: :any,                 x86_64_linux:  "5c25b745c90874a36ab78b2ae6795beba308fbe5439b33cc1760f96bf79a6e26"
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
