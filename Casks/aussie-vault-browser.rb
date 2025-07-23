cask "aussie-vault-browser" do
  version "1.0.2"
  sha256 :no_check

  url "https://github.com/bilalmohib/aussie-vault-browser-releases/releases/download/v#{version}/AussieVaultBrowser-#{version}.dmg"
  name "Aussie Vault Browser"
  desc "Secure remote browser with VPN capabilities and 1Password integration"
  homepage "https://github.com/bilalmohib/aussie-vault-browser-releases"

  auto_updates true

  app "Aussie Vault Browser.app"

  postflight do
    # Set permissions for security features
    system_command "/usr/bin/codesign",
                   args: [
                     "--verify",
                     "--verbose",
                     "#{appdir}/Aussie Vault Browser.app"
                   ],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/aussie-vault-browser",
    "~/Library/Caches/com.aussievault.browser",
    "~/Library/Logs/aussie-vault-browser",
    "~/Library/Preferences/com.aussievault.browser.plist",
    "~/Library/Saved Application State/com.aussievault.browser.savedState",
  ]
end 