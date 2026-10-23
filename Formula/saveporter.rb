class Saveporter < Formula
  desc "Convert emulator save states between RetroArch, EmulatorJS and mGBA"
  homepage "https://github.com/chenasraf/saveporter"
  url "https://github.com/chenasraf/saveporter/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "11f797edbb347945bdef2d6baebcb31b13c01effc057a8e1c25ccf562f87b484"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/saveporter-0.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "2e1a6412572ab6d756df776d21e239f7059c0d4bc467f5824eb257d40adb8dc8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4ad6ba082ee48c19d07b7f011590c14c7383a5af6b020faaaad58a7c4730c12a"
    sha256 cellar: :any,                 x86_64_linux:  "03b4d3f07695afd06392d5e2e52478c86537f718fba0b1f0df5951bc4db4cb18"
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
