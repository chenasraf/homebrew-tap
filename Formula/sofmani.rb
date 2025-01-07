class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "3a2091dcd22be91168f4523941232dfe59c9b45cea0036bffea8df78b93894b7"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "e970bf6ea955d09c664e5393c093ee288bf1cd772f392b973f41580607d224b9"
    sha256 cellar: :any_skip_relocation, ventura:      "647c2a55be3d21e934a1dca17dbbe287257c8a784755bde67f871dd1f3e57d69"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ba2d8e498499fca51e3bb3e1548ae1505234396b8071299e9c34248581639fce"
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
