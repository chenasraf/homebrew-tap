class Vstask < Formula
  desc "Run VS Code tasks.json from the terminal with deps and OS-aware execution"
  homepage "https://github.com/chenasraf/vstask"
  url "https://github.com/chenasraf/vstask/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "d9db88a4894bb495d861c35c4bc5041be76c14faf3a99fdbafb280a392b081e4"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/vstask-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "5a5c9c4b65be0ae84ecd8fdc08db3aab370e1c0c5da2800c18cc59abdc750604"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a9a11c2b492182ccf5619bcf52fbdcfdc638a94ab244b60a815cc3cba5aa466f"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "962b6f7fd29b8ce085ae2f8851673624481c613710585da2151455fc477194a4"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "vstask", "."
    bin.install "vstask"
  end

  test do
    assert_match "Usage: vstask [task-name]", shell_output("#{bin}/vstask -h")
  end
end
