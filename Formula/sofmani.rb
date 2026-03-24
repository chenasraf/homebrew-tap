class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.24.0.tar.gz"
  sha256 "8e83355a872350ff2f5b2020fd841b523a81adfd2d8c5f699559857a151eb88f"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.24.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "f50e8af168320fb81c9b0833c0159f4911a32a80b002cd247f903f559783744e"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "f55846cff31ec6acb00161dca73967f9490fc7ac5667137160382e9aeb63346f"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "7e99c4e56723c799dd53852803743554843ae3bc0c7c426dbde886cdd146a2e7"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ee9ef67c000266a9c6b962ce034a6f44199b6ad03a4658baa25b2f460af2eb32"
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
