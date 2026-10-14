class Saveporter < Formula
  desc "Convert emulator save states between RetroArch, EmulatorJS and mGBA"
  homepage "https://github.com/chenasraf/saveporter"
  url "https://github.com/chenasraf/saveporter/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9accc3f45f1db7b7eed0c23ffc97552768bd1b25363da21cfdf5caa9342bf2fe"
  license "MIT"

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "saveporter", "./cmd/saveporter"
    bin.install "saveporter"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/saveporter --version")
  end
end
