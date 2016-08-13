#!/bin/zsh
antibody bundle --static < "$DOTFILES_ROOT/topics/antibody/bundles.txt" > ~/.bundles.txt
antibody bundle --static sindresorhus/pure >> ~/.bundles.txt
antibody bundle --static < "$DOTFILES_ROOT/topics/antibody/last_bundles.txt" >> ~/.bundles.txt
