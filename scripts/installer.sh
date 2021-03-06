#!/bin/sh
#
# Run all dotfiles installers.

# Exit immediately if a command exits with a non-zero status
set -e

# Change to the .dotfiles topics directory.
# Typically this will be /Users/<username>/.dotfiles/topics
cd "$(dirname "$0")"/../topics

# Find the installers and run them iteratively
git ls-tree --name-only -r HEAD | grep install.sh | while read -r installer; do
  echo "› ${installer}..."
  sh -c "$installer"
done
