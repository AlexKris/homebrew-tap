cask "mihomo-sparkle" do
  arch arm: "arm64", intel: "x64"

  version "1.26.9"
  sha256 arm:   "301e1daf01b5c836d282e3d0dec779f51e43a8d182b2f850df7a04bcd63cd5ac",
         intel: "a3a60b3c234faa1d9ff99448ebfd4891223887ab63958da45809ab6d26b084ef"

  url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-#{arch}.pkg"
  name "Sparkle"
  desc "Another Mihomo GUI (xishang0128 fork)"
  homepage "https://github.com/xishang0128/sparkle"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

  pkg "sparkle-macos-#{version}-#{arch}.pkg"

  uninstall pkgutil: "sparkle.app"

  zap trash: [
    "~/Library/Application Support/sparkle",
    "~/Library/Logs/sparkle",
    "~/Library/Preferences/sparkle.app.plist",
    "~/Library/Saved Application State/sparkle.app.savedState",
  ]
end