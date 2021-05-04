# System Preferences > Dock > Size
defaults write com.apple.dock tilesize -float 40
# System Preferences > Dock > Magnification
defaults write com.apple.dock magnification -bool false
# System Preferences > Dock > Position on screen
defaults write com.apple.dock orientation -string "bottom"
# System Preferences > Dock > Minimise windows using
defaults write com.apple.dock mineffect -string "scale"
# System Preferences > Dock > Minimise windows into application icon
defaults write com.apple.dock "minimize-to-application" -bool true
# System Preferences > Dock > Animate opening applications
defaults write com.apple.dock launchanim -bool false
# System Preferences > Dock > Automatically hide and show Dock
defaults write com.apple.dock autohide -bool true
# System Preferences > Dock > Show indicators for open applications
defaults write com.apple.dock "show-process-indicators" -bool true
# System Preferences > Dock > Show recent applications in Dock
defaults write com.apple.dock "show-recents" -bool true

# System Preferences > Spotlight > Search results
defaults write com.apple.spotlight orderedItems -array \
    '{ "enabled" = 1; "name" = "APPLICATIONS"; }' \
    '{ "enabled" = 1; "name" = "MENU_SPOTLIGHT_SUGGESTIONS"; }' \
    '{ "enabled" = 1; "name" = "MENU_CONVERSION"; }' \
    '{ "enabled" = 1; "name" = "MENU_EXPRESSION"; }' \
    '{ "enabled" = 0; "name" = "MENU_DEFINITION"; }' \
    '{ "enabled" = 1; "name" = "SYSTEM_PREFS"; }' \
    '{ "enabled" = 0; "name" = "DOCUMENTS"; }' \
    '{ "enabled" = 0; "name" = "DIRECTORIES"; }' \
    '{ "enabled" = 0; "name" = "PRESENTATIONS"; }' \
    '{ "enabled" = 0; "name" = "SPREADSHEETS"; }' \
    '{ "enabled" = 0; "name" = "PDF"; }' \
    '{ "enabled" = 0; "name" = "MESSAGES"; }' \
    '{ "enabled" = 0; "name" = "CONTACT"; }' \
    '{ "enabled" = 0; "name" = "EVENT_TODO"; }' \
    '{ "enabled" = 0; "name" = "IMAGES"; }' \
    '{ "enabled" = 0; "name" = "BOOKMARKS"; }' \
    '{ "enabled" = 0; "name" = "MUSIC"; }' \
    '{ "enabled" = 0; "name" = "MOVIES"; }' \
    '{ "enabled" = 0; "name" = "FONTS"; }' \
    '{ "enabled" = 0; "name" = "MENU_OTHER"; }'
