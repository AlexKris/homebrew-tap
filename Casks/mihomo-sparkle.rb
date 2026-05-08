cask "mihomo-sparkle" do
  arch arm: "arm64", intel: "x64"

  version "1.26.4"
  sha256 arm:   "b7c01a698f8c6aba6135867fde491133f41e2ace9cd5025e480e9c8b3f89a059",
         intel: "149ae3e81225b52f9998c7731aeb9580f8d1ead080b3cb7b5d824bde3ff6f28b"

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
