class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.28.2.tar.gz"
  sha256 "dfb1d5616f15812058ae2db8d723916d78502892cf3640bdad63f9c653f84d38"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.28.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "fd3c9014d2c2dc45c13b9f3a9655bc4ba9a90f95aa86c57eb27247341b16ff75"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "13f7c8f3587f8ccf0459a5a131a32c0cd7e38bea47af8fb85485ebadc3819a29"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4169b83b949c5009f3b867804df1567abf963e6fc86be5779dd8a4a7b764af51"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "bc5ad0b41d66cbc272407bfa4bbf4898a36dac6d1f999bef7166da11efc9414d"
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
