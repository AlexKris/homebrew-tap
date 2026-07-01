cask "mihomo-sparkle" do
  arch arm: "arm64", intel: "x64"

  version "1.26.6"
  sha256 arm:   "ac40fcea5c700e05118fb64893950ac9a42cb4485f44d74991d6df731fe2735f",
         intel: "4ef8f5079f9a982a06819f548659220a25194ead0439f27d856d5a54e525699c"

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