class DirenvDotenvx < Formula
  desc "Plugin for direnv to load .env files using dotenvx"
  homepage "https://github.com/chenasraf/direnv-dotenvx"
  url "https://github.com/chenasraf/direnv-dotenvx/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "88d35d74948e8a0afcb2400520f92685a0832147c95241e1fc9425ed9dc33579"
  license "MIT"

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
    assert_path_exists libexec/"use_dotenvx.sh"
  end
end
