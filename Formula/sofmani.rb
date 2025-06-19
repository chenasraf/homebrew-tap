class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.9.2.tar.gz"
  sha256 "52c1f2ef910e43e66818adc4437f088b0bdada8e3bf414a4eb2ba164b9337840"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.9.1"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "57e1e6cb85081132d86323a564deeb969bdefc47d8119e5aad0aaad874b94ce9"
    sha256 cellar: :any_skip_relocation, ventura:      "7ba2add293c6571d35adbb8f0b8b41202ce34661632ef128599b08562e3d83bf"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "688297f07f422759a1f128c9fc6684ef898d75353756198afba14e08e544d170"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "sofmani", "."
    bin.install "sofmani"
  end

  test do
    assert_match "Usage: sofmani [options] [config_file]", shell_output("#{bin}/sofmani -h")
  end
end
