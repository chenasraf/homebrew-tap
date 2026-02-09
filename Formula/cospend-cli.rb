class CospendCli < Formula
  desc "Command-line interface for adding expenses to Nextcloud Cospend projects"
  homepage "https://github.com/chenasraf/cospend-cli"
  url "https://github.com/chenasraf/cospend-cli/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "4d1a3e841249ab204833fb35c13207cbac52e84858b556fba11ef0f92b9cd802"
  license "MIT"

  bottle do
    root_url "https://github.com/chenasraf/homebrew-tap/releases/download/cospend-cli-1.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "d408c54cdc1d38e926dfdbccdc8c20b4d5c089dd26f2c700c91810f00936761d"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "a9ed5df30e7398015542add23a02098436f0283b9fb13cddda64c5383295c495"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "ed2028deafb5de051f051804ceac7aabf5aa2776be7497fe93126f2bf5bb7994"
  end

  depends_on "go" => [:build]

  def install
    system "go", "build", "-buildmode", "exe", "-o", "cospend", "."
    bin.install "cospend"
  end

  test do
    msg = "cospend is a command-line interface for adding expenses to Nextcloud Cospend projects."
    assert_match msg, shell_output("#{bin}/cospend -h")
  end
end
