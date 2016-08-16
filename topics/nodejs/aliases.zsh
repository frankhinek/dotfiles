#!/bin/zsh

nvm_upgrade() {
  # Upgrade NVM by changing to the $NVM_DIR, pulling down the latest changes,
  # checking out the latest version, and activating the new version
  ( cd "$NVM_DIR"
    git fetch origin
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
  ) && . "$NVM_DIR/nvm.sh"
}

alias npis='npm install --save'
alias npisd='npm install --save-dev'
alias npig='npm install -g'
alias npit='npm init'
alias npi='npm install'
