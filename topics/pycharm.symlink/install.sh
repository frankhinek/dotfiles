#!/bin/sh
if [ "$(uname -s)" = "Darwin" ]; then
	# Set a user environment variable that tells PyCharm where to find the idea.properties file
	ln -sf "$DOTFILES_ROOT/topics/pycharm.symlink/pycharm.properties.plist" "$HOME/Library/LaunchAgents/pycharm.properties.plist"
fi
