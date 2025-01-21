class Sofmani < Formula
  desc "Installs software from a declerative config on any system"
  homepage "https://github.com/chenasraf/sofmani"
  url "https://github.com/chenasraf/sofmani/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "aa37b535490b36e8144bb3afc7e47722355136f66d66cad4988ce3e6964b664e"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/sofmani-1.7.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "c61efe985e05df5ae83bdd3efbae458fb89be800c9219319da7dd80fc2ec6af6"
    sha256 cellar: :any_skip_relocation, ventura:      "f1a04f2d56a6e68a63090188ec85e6f578f01662aaf589cac334491e6c5af32c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "1dc2de7f055c43f31f3fa03830bf8b57391fb13bcaadfef17014c34ffff9f76f"
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
