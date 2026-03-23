class Vstask < Formula
  desc "Run VS Code tasks.json from the terminal with deps and OS-aware execution"
  homepage "https://github.com/chenasraf/vstask"
  url "https://github.com/chenasraf/vstask/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "70ff9fa05496f8c477f23467b85db165c506dad200da242127f07a83d6d9c0f5"
  license "CC0-1.0"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/vstask-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "1d5535ee166df4cab2fefc0af0691d36113897125874a3fc36841ffe0547b140"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "fa797d3d145a3dc7d8061b66f2c7c488fc084c6a2664e4a19a1a81a6b0248508"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "60dceb31eef15a32c32a4b2d813821e1436afcc740a10d0fd1b3efea6ff74b1f"
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
