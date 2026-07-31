cask "mihomo-sparkle" do
  arch arm: "arm64", intel: "x64"

  version "1.26.7"
  sha256 arm:   "0d6805d243d3fc5ce1022daae1c5a61bbbfcade39cd155dca85a355fcda1b737",
         intel: "aff13f7f6aee276ff043ebcab6893865a004cdcc02290e307ce064e8381a85d7"

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