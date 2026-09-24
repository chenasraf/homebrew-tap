class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.34.0.tar.gz"
  sha256 "9c647fecd1255a0bf256b2b5f4d3edaf7df51f2fdc5cdce58c3a656cdd18979f"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.34.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "0aa6cdde7afaae0748450776c7501e8720017f3a3834132a0b54cc24e59c0786"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "992a3ca115b257ba357c3d182e524a992b437797310195356faa9c84b674aa2d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "797fd6368dc37a0900774750792b65349ab0b32757912b0eb37f59f00938922b"
    sha256 cellar: :any,                 x86_64_linux:  "056f15c64caa9399a63b8bc9e9e65a452be636507b8a2623e967fb9889424c0b"
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
