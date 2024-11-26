class Redot < Formula
  desc "Multi-platform 2D and 3D game engine"
  homepage "https://redotengine.org/"
  url "https://github.com/Redot-Engine/redot-engine/releases/download/redot-#{@version}-stable/Redot_v#{@version}-stable_macos.zip"
  sha256 "27c19f3ab99a739d0917ade5948f5de4b256d7c664c7a88c9a8f76f6f226baee"
  license "MIT"

  @version = "4.3"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)[._-]stable$/i)
    strategy :github_latest
  end

  depends_on :macos
  depends_on macos: :high_sierra

  app "Redot.app"
  binary "#{appdir}/Redot.app/Contents/MacOS/Redot", target: "redot"

  uninstall quit: "org.redotengine.redot"

  zap trash: [
    "~/Library/Application Support/Redot",
    "~/Library/Caches/Redot",
    "~/Library/Saved Application State/org.redotengine.redot.savedState",
  ]
end
