class DirenvDotenvx < Formula
  desc "Plugin for direnv to load .env files using dotenvx"
  homepage "https://github.com/chenasraf/direnv-dotenvx"
  url "https://github.com/chenasraf/direnv-dotenvx/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "88d35d74948e8a0afcb2400520f92685a0832147c95241e1fc9425ed9dc33579"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/direnv-dotenvx-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c22cb08b0b5bb9b6e27ac6e2f634dfffbc4ff6c944a450dfae44cbb42663a398"
    sha256 cellar: :any_skip_relocation, ventura:      "c9de8387ff87263635c8b1d07cecca27fcb81c9174a7248f36346ed670c71043"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9059db5318112156b0a84123eeb28acad21a03c1b06dc2545c72c053078a5e83"
  end

  def install
    # Install script into the Cellar
    libexec.install "use_dotenvx.sh"

    # Create global direnv lib path
    direnv_lib = File.expand_path("~/.config/direnv/lib")
    mkdir_p direnv_lib

    # Symlink into global location
    ln_sf libexec/"use_dotenvx.sh", "#{direnv_lib}/use_dotenvx.sh"
  end

  def caveats
    <<~EOS
      use_dotenvx is now available globally to direnv.

      In your .envrc:
        use_dotenvx

      Then run:
        direnv allow
    EOS
  end

  test do
    direnv_lib = File.expand_path("~/.config/direnv/lib")
    assert_path_exists direnv_lib/"use_dotenvx.sh"
  end
end
