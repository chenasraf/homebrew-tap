class DirenvDotenvx < Formula
  desc "Plugin for direnv to load .env files using dotenvx"
  homepage "https://github.com/chenasraf/direnv-dotenvx"
  url "https://github.com/chenasraf/direnv-dotenvx/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "da84791c1374d09853acc6283db583f3377fc350e7e27324d8228af4130fa3d1"
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

    source = "#{libexec}/use_dotenvx.sh"
    target = "#{direnv_lib}/use_dotenvx.sh"

    # Only create the symlink if it doesn't already exist or points elsewhere
    ln_sf source, target if !File.exist?(target) || !File.identical?(source, target)
  end

  def caveats
    <<~EOS
      ✅ Plugin installed: #{opt_libexec}/use_dotenvx.sh

      To use it in your .envrc, you have two options:

      1. Source it directly:

           source #{opt_libexec}/use_dotenvx.sh

      2. Or link it globally for short-form use:

           mkdir -p ~/.config/direnv/lib
           ln -s #{opt_libexec}/use_dotenvx.sh ~/.config/direnv/lib/use_dotenvx.sh

         Then in your .envrc:

           use_dotenvx

      After that, run:

        direnv allow
    EOS
  end

  test do
    assert_path_exists libexec/"use_dotenvx.sh"
  end
end
