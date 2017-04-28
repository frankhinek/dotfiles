#!/bin/sh
if which brew >/dev/null 2>&1; then
  if ! which antibody >/dev/null 2>&1; then
    brew install getantibody/tap/antibody
  else
    brew upgrade antibody
  fi
fi

antibody bundle < "$DOTFILES/topics/antibody/bundles.txt" > ~/.zsh_plugins.sh
antibody update
