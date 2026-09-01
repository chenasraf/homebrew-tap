class DirenvDotenvx < Formula
  desc "Plugin for direnv to load .env files using dotenvx"
  homepage "https://github.com/chenasraf/direnv-dotenvx"
  url "https://github.com/chenasraf/direnv-dotenvx/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "d00b7d5d31b5a7d715e627fc4455a51dbad6b13db9d15e1644f708256acd9217"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/direnv-dotenvx-1.2.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "af8679855c8d204d41d3ac0e1cd2efe65f6821e3e5930f1188803a47ba52ee23"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "cae0bc7efac5cd92d665fb47b3de5eb58e5e100c45416c1faf31e70e9f1ade38"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9f4c64157414eff4cc3cb7b3713cbc658ca384ca3b2e8394e45efdb5bd4fdd29"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "c4d3e739074b98777cff1d3c29a1ff874fbe0999c62217aa5115b0685386b458"
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
