class DirenvDotenvx < Formula
  desc "Plugin for direnv to load .env files using dotenvx"
  homepage "https://github.com/chenasraf/direnv-dotenvx"
  url "https://github.com/chenasraf/direnv-dotenvx/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "979e29559ab32b824c5068317eb14d0eb9c96592d929fed164a70c06cfba3269"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/direnv-dotenvx-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "65ef06da31f00660ece27a0476694f07f3ba3e9bd095599e6f22821f1e66153c"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "2a7b5ca7de9ff19a2849ceda45bf93e74a29c36ea66e99554ecf77d25eaac2bb"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5def544ad9d9086464105dfaeb5aa1872094e74eeb6be42fa0f28ce295c1f8e9"
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
