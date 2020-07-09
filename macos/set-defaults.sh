# Sets reasonable macOS defaults.
#
# Or, in other words, set shit how I like in macOS.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Run ./set-defaults.sh and you'll be good to go.

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set a really fast key repeat.
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
defaults write com.apple.universalaccess slowKey -int 0

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Run the screensaver if we're in the bottom-left hot corner.
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Clear Dock
defaults write com.apple.dock persistent-apps -array '()'
defaults write com.apple.dock orientation right
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "show-recents" -bool false

# Swap fn key in Touchbar
defaults write com.apple.touchbar.agent PresentationModeFnModes -dict appWithControlStrip fullControlStrip functionKeys fullControlStrip
defaults write com.apple.touchbar.agent PresentationModeGlobal functionKeys

# Disable shortcuts to change input source
defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 60 '
{
            enabled = 0;
            value =             {
                parameters =                 (
                    32,
                    49,
                    262144
                );
                type = standard;
            };
        }
'

defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 61 '
{
            enabled = 0;
            value =             {
                parameters =                 (
                    32,
                    49,
                    786432
                );
                type = standard;
            };
        }
'

# Disable shortcuts about man page in Terminal
defaults write pbs NSServicesStatus -dict-add "com.apple.Terminal - Open man Page in Terminal - openManPage" '{
        "enabled_context_menu" = 0;
        "enabled_services_menu" = 0;
        "presentation_modes" =         {
            ContextMenu = 0;
            ServicesMenu = 0;
        };
    }'

defaults write pbs NSServicesStatus -dict-add "com.apple.Terminal - Search man Page Index in Terminal - searchManPages" '{
        "enabled_context_menu" = 0;
        "enabled_services_menu" = 0;
        "presentation_modes" =         {
            ContextMenu = 0;
            ServicesMenu = 0;
        };
    }'

# 390Sebulshik
defaults write com.apple.HIToolbox AppleEnabledInputSources -array '
(
        {
        InputSourceKind = "Keyboard Layout";
        "KeyboardLayout ID" = 252;
        "KeyboardLayout Name" = ABC;
    },
        {
        "Bundle ID" = "com.apple.inputmethod.Korean";
        InputSourceKind = "Keyboard Input Method";
    },
        {
        "Bundle ID" = "com.apple.inputmethod.EmojiFunctionRowItem";
        InputSourceKind = "Non Keyboard Input Method";
    },
        {
        "Bundle ID" = "com.apple.PressAndHold";
        InputSourceKind = "Non Keyboard Input Method";
    },
        {
        "Bundle ID" = "com.apple.inputmethod.Korean";
        "Input Mode" = "com.apple.inputmethod.Korean.390Sebulshik";
        InputSourceKind = "Input Mode";
    }
)'
