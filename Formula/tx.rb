class Tx < Formula
  desc "Tmux session manager"
  homepage "https://github.com/chenasraf/tx"
  url "https://github.com/chenasraf/tx/archive/refs/tags/v2.5.3.tar.gz"
  sha256 "b6699b63b8d73276bb0b00d2d77112e54c2d9fdd7659abfc9e2fab10ba4dfc1a"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/tx-2.5.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "819329beec270f1fcc918cb2b89859aa7662f7b75dcdd5cb7f83466252d5d302"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "2bec8f1da090674b6374ffc54550b26d44f4dc573d4d25eff5c592fe6c19ff96"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "5d7862f9a8d05ff68ff8b49bc1e7f35975c1042ede524c7f9953e2bc5bbf8169"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2945c678ca61398071ba82653535e2c1040522f7bc1c58e4ba9e87d13a7bee84"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "tx", "."
    bin.install "tx"
  end

  test do
    msg = "tx is a tmux session manager that creates sessions from YAML configuration files."
    assert_match msg, shell_output("#{bin}/tx -h")
  end
end
