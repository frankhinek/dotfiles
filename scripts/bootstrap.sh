#!/bin/sh
#
# This script configures git, symlinks .dotfiles, and installs dependencies.

################################################################################
# FUNCTION DEFINITION                                                          #
#                                                                              #
# Functions used to display messages to the user                               #
################################################################################
info () {
  # shellcheck disable=SC2059
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  # shellcheck disable=SC2059
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  # shellcheck disable=SC2059
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  # shellcheck disable=SC2059
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

################################################################################
# FUNCTION DEFINITION                                                          #
#                                                                              #
# Configures and manages ~/.gitconfig which stores configuration settings      #
# for git.                                                                     #
################################################################################
setup_gitconfig () {
  info 'Setting up gitconfig'
  # If there is no git user.email defined, we'll assume it's a new machine/setup
  # and request it.
  if [ -z "$(git config --global --get user.email)" ]; then
    user ' - What would you like to use as your git author name?'
    read -r user_name
    user ' - What would you like to use as your git email address?'
    read -r user_email

    git config --global user.name "$user_name"
    git config --global user.email "$user_email"
  elif [ "$(git config --global --get dotfiles.managed)" != "true" ]; then
    # If user.email exists, let's check for dotfiles.managed configuration. If
    # it is not true, we'll backup the existing .gitconfig file and copy the
    # previously configured user.name and user.email in the new .gitconfig file.
    user_name="$(git config --global --get user.name)"
    user_email="$(git config --global --get user.email)"
    mv ~/.gitconfig ~/.gitconfig.backup
    success "Moved ~/.gitconfig to ~/.gitconfig.backup"
    git config --global user.name "$user_name"
    git config --global user.email "$user_email"
  else
    # This .gitconfig was created and is being managed by the dotfiles scripts.
    info "Existing ~/.gitconfig already managed by dotfiles"
  fi
  # Include the gitconfig.local file
  git config --global include.path ~/.gitconfig.local
  # Finally tell git that this is a managed configuration, thereby preventing
  # it being overwritten by future executions of this script.
  git config --global dotfiles.managed true
  success 'Completed gitconfig setup'
}

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

################################################################################
# FUNCTION DEFINITION                                                          #
#                                                                              #
# Symlinks any *.symlink files in the dotfiles repository to ~/                #
################################################################################
symlink_dotfiles () {
  info 'Installing dotfiles'
  find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*' |
    while read -r src; do
      dst="$HOME/.$(basename "${src%.*}")"
      link_file "$src" "$dst"
    done
}

################################################################################
# SCRIPT EXECUTION                                                             #
################################################################################

# Determine the path of the .dotfiles directory.
# Typically this will be /Users/<username>/.dotfiles/
cd "$(dirname "$0")/.."
DOTFILES_ROOT=$(pwd -P)

# Exit immediately if a command exits with a non-zero status
set -e

# Print an empty line for visual clarity
echo ''

# Execute the setup_gitconfig() function
setup_gitconfig

# Execute the symlink_dotfiles() function
symlink_dotfiles

# Print success message to user
echo '\n  dotfiles bootstrap completed successfully!'
