#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
    # Set a user environment variable that tells PyCharm where to find the idea.properties file
    ln -sf "$DOTFILES_ROOT/topics/pycharm.symlink/pycharm.properties.plist" "$HOME/Library/LaunchAgents/pycharm.properties.plist"

    # Install PyCharm files that change regularly during use due to last update counters
    cat "$DOTFILES_ROOT"/topics/pycharm.symlink/config/colors/_@user_Darcula.icls.example > "$DOTFILES_ROOT"/topics/pycharm.symlink/config/colors/_@user_Darcula.icls
    cat "$DOTFILES_ROOT"/topics/pycharm.symlink/config/options/jdk.table.xml.example > "$DOTFILES_ROOT"/topics/pycharm.symlink/config/options/jdk.table.xml
    cat "$DOTFILES_ROOT"/topics/pycharm.symlink/config/options/options.xml.example > "$DOTFILES_ROOT"/topics/pycharm.symlink/config/options/options.xml
fi
