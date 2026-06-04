cask "mihomo-sparkle" do
  arch arm: "arm64", intel: "x64"

  version ""
  sha256 arm:   "a047100191e583e90a884871ffef180350d48eb58fbbefd5a4ade6ca466eb58b",
         intel: "2e7d5e9dee8aa154f3a3cd88a53c43d4e84b3436e01a9674fa0e2cb8bc94c018"

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
