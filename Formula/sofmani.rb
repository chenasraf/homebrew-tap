class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.29.0.tar.gz"
  sha256 "35323e58483f14d5c29351663c996742f6fe2447147bc60de4ad1675b1a69747"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.29.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "4170909709d97c31f7abb62ae99eba52d099127c882fb914ea24b4ca6b5e2e18"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "551cc717fb57055c6ffd26ba689ca854d5ecb2a4821b16e5053c9cf505f113ee"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9a18122089a64d93402ab38aee3bd0b31f265b71679e218458f44a87cfc007c1"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "33399d4849168ea5e4f0ee283c18bb4df5fc0ca4e438f47098314fecff34ec31"
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
