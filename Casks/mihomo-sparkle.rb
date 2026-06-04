cask "mihomo-sparkle" do
  arch arm: "arm64", intel: "x64"

  version ""
  sha256 arm:   "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
         intel: "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"

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
