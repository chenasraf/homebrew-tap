class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.19.1.tar.gz"
  sha256 "cac057d52e588166964685f49c0fc39fe487f5efd39955abff58f2120db6cc98"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.19.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "04b833be501a6eaf2898dd5f5464b6e90b8c8dce8f301c3464c35b28307d4a56"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "5bb9b8ec8f8af11ba3c2e79abf6a79598ae8a1d53764b65c270c0d47d1b4d3ec"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "339ed5b1316c4f3683cadbb3f5d2ee40ee43476a0f9f3b59c00358793a7b88d5"
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
