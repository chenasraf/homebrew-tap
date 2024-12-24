class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "451cf51f9b11887f072cc9d5fe7e3640adbb5638852c84613effaaa3df875f73"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c7ce9dc3c9e920d31b3eca7e5ed92edfd649c147d8e01ebd122194b88aa6def6"
    sha256 cellar: :any_skip_relocation, ventura:      "902d9519ab6d4869a56e873099857f413c4378dbf3f62f28a54118d6e6bdf00d"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "033df229ecad0b6344e8a183b35ccaf45cce369fd83d1fe4ae88c9cb1ab7f15b"
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
