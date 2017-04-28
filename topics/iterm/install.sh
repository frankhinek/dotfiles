#!/bin/zsh

# Exit the script immediately if it is not being run on a macOS system
[ "$(uname -s)" != "Darwin" ] && exit 0

# The com.googlecode.iterm2.plist.example included in the git repository is
# configured to use /Users/frank as the path prefix for the .dotfiles directory
# location.  The sed replaces "/Users/frank" with  the current user's $HOME
# directory before writing the result to com.googlecode.iterm2.plist.
sed "s;/Users/frank;$HOME;g" \
  "$DOTFILES_ROOT"/topics/iterm/com.googlecode.iterm2.plist.example > "$DOTFILES_ROOT"/topics/iterm/com.googlecode.iterm2.plist

# Configure iTerm2 to read Preferences from the iterm dotfiles topic
defaults write com.googlecode.iterm2 "PrefsCustomFolder" -string "$DOTFILES_ROOT/topics/iterm"
defaults write com.googlecode.iterm2 "LoadPrefsFromCustomFolder" -bool true
