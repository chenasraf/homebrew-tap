class DirenvDotenvx < Formula
  desc "A direnv plugin to load .env files using dotenvx"
  homepage "https://github.com/chenasraf/direnv-dotenvx"
  url "https://github.com/chenasraf/direnv-dotenvx/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "<SHA256_HERE>"
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
    assert_predicate libexec/"use_dotenvx.sh", :exist?
  end
end
