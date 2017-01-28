#!/bin/zsh
if ! which brew >/dev/null 2>&1; then
  brew untap -q getantibody/homebrew-antibody || true
  brew tap -q getantibody/homebrew-antibody
  brew install getantibody/tap/antibody
fi

antibody bundle < "$DOTFILES_ROOT/topics/antibody/bundles.txt" > ~/.bundles.txt
antibody bundle sindresorhus/pure >> ~/.bundles.txt
antibody bundle < "$DOTFILES_ROOT/topics/antibody/last_bundles.txt" >> ~/.bundles.txt
