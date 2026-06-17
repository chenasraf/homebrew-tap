class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.32.0.tar.gz"
  sha256 "7099cc86881da59ba66f1104c8338f77dc86ff1c1078a5225d0ba58bef36f082"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.31.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "33b982d92d05a1959496024ad0a70696237b9c4f191d7232f0c3b17bdbccc51b"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "3b5bc87a73b80313ad1faae947d236c4354667eba8ba4f865f5ea68af0331a75"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4c383f756ad7fec471978b8d2cc591599c8de36a51b44423599695a7fcf2c3ab"
    sha256 cellar: :any,                 x86_64_linux:  "80fcdc4cb44608e08cf71eb762c915550f9efcc0d9dd96b8ff835a7ce4beb56c"
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
