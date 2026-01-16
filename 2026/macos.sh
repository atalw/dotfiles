#!/bin/bash

# MacOS Defaults Script
# Run this once on a new machine to set up sensible defaults.

echo "Setting MacOS defaults..."

# Close System Preferences to prevent overriding
osascript -e 'tell application "System Preferences" to quit'

# ------------------------------------------------------
# Finder
# ------------------------------------------------------
# Show all file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Search the current folder by default (not "This Mac")
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# ------------------------------------------------------
# Dock
# ------------------------------------------------------
# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Remove the auto-hiding delay
defaults write com.apple.dock autohide-delay -float 0

# ------------------------------------------------------
# Screenshots
# ------------------------------------------------------
# Save screenshots to ~/Screenshots (create folder first)
mkdir -p "${HOME}/Screenshots"
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# ------------------------------------------------------
# TextEdit
# ------------------------------------------------------
# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
defaults write com.apple.TextEdit NewWindowTarget -string "txt"

# ------------------------------------------------------
# Keyboard (Commented Out - Enable if desired)
# ------------------------------------------------------
# Disable press-and-hold for keys in favor of key repeat
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
# KeyRepeat: 1 = very fast, 2 = fast (default)
# InitialKeyRepeat: 15 = 225ms, 25 = 375ms, 35 = 525ms (default)
# defaults write NSGlobalDomain KeyRepeat -int 1
# defaults write NSGlobalDomain InitialKeyRepeat -int 15

# ------------------------------------------------------
# Done
# ------------------------------------------------------
echo "Done. Note that some changes require a logout/restart to take effect."
killall Finder
killall Dock
