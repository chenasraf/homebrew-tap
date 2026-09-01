class DirenvDotenvx < Formula
  desc "Plugin for direnv to load .env files using dotenvx"
  homepage "https://github.com/chenasraf/direnv-dotenvx"
  url "https://github.com/chenasraf/direnv-dotenvx/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "d00b7d5d31b5a7d715e627fc4455a51dbad6b13db9d15e1644f708256acd9217"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/direnv-dotenvx-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "20c93b093a7c7eb210e880a29ab11c15ccff9daf0ef2acdb3989c604c93f67b7"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "962f18705ad4143148ca7d6fded5803eb059887305caf201fbe384afb41e6ef6"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "fb34adf8ff9a6d671cf17557a3449452e0feb250b759aeeba149213b7ca89153"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "2b0c6cf7750ff355a9fc7f07d3a83f8c9fd5813b2b905703033ffded27c07907"
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
