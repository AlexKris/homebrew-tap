cask "mihomo-sparkle" do
  arch arm: "arm64", intel: "x64"

  version "1.26.10"
  sha256 arm:   "4fce4ea073f2ee0320847512460f325f7d345e42009abb156f21986b7d7755ba",
         intel: "80a5f2e95f407d08193978f4e636b9281f1a2c695fddcd786a4ca7e60dd54311"

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