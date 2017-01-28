#!/bin/zsh
antibody bundle < "$DOTFILES_ROOT/topics/antibody/bundles.txt" > ~/.bundles.txt
antibody bundle sindresorhus/pure >> ~/.bundles.txt
antibody bundle < "$DOTFILES_ROOT/topics/antibody/last_bundles.txt" >> ~/.bundles.txt
