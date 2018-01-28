#!/bin/sh
################################################################################
# FUNCTION DEFINITION                                                          #
#                                                                              #
# Symlinks files provided as arguments to the function.  If the destination    #
# already exists then it is backed up by renaming to *.backup.                 #
################################################################################
link_file() {
  if [ -e "$2" ]; then
    if [ "$(readlink "$2")" = "$1" ]; then
      success "skipped $1"
      return 0
    else
      mv "$2" "$2.backup"
      success "moved $2 to $2.backup"
    fi
  fi
  ln -sf "$1" "$2"
  success "linked $1 to $2"
}

if test "$(which charm)"; then
	if [ "$(uname -s)" = "Darwin" ]; then
		# Current major version of PyCharm
		MAJOR_VERSION="2017.3"
		# Contains the PyCharm catalog with plugins
		PYCHARM_CATALOG="$HOME/Library/Application Support/PyCharm$MAJOR_VERSION"
		# Contains the rest of the PyCharm configuration settings
		PYCHARM_PREFERENCES="$HOME/Library/Preferences/PyCharm$MAJOR_VERSION"

		# Symlink both directories, backing up existing dirs if they exist
		link_file "$DOTFILES_ROOT/topics/pycharm/catalog" "$PYCHARM_CATALOG"
		link_file "$DOTFILES_ROOT/topics/pycharm/preferences" "$PYCHARM_PREFERENCES"
	fi
fi
