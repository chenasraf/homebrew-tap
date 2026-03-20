class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.22.0.tar.gz"
  sha256 "fa1eb51377114a58fb25d7da45e3a6a8488044700cc727a6c9f57e240a1cdee5"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.22.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "0c1459a58daf43ba444a8080b6dff98bdc08c53708f46b6723c2ceb684c3594a"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "05975210d96a4b7b4f846dbcad87580b021e9afdc5dd0206fc9e18832e21555e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "e215754e103d485a28e347ec03d753aac24353d0382158c2c8a3fbccaf513e2f"
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
