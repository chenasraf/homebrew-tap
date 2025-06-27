class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.10.0.tar.gz"
  sha256 "197af0458bbd58d26c90c886c2fa295141b2cfc8b9141378c6ba5fb864ef45a4"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.10.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "f3a000449281999a8be9c383f7a84cc71b5cc2f0df8f0ee524024dcbe3bc6d30"
    sha256 cellar: :any_skip_relocation, ventura:      "f79bc2243cd1543ba005210324dd3cdf35ceac2d49fd7ca3a8c791571bb919af"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3f92b4a5c3be65d9ecaa1d09e2fcff1967b29a14b2624c05e4d52e88089137d5"
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
