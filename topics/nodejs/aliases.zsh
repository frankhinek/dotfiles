#!/bin/zsh

#!/bin/sh
if which npm >/dev/null 2>&1; then

  dcleanup() {
    # Upgrade NVM by changing to the $NVM_DIR, pulling down the latest changes,
    # checking out the latest version, and activating the new version
    ( cd "$NVM_DIR"
      git fetch origin
      git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
    ) && . "$NVM_DIR/nvm.sh"
  }

  npm() {
    if [ "$1" = "__cleanup" ]; then
      dcleanup
    else
      command docker "$@"
    fi
  }

  alias npis='npm install --save'
  alias npisd='npm install --save-dev'
  alias npig='npm install -g'
  alias npit='npm init'
  alias npi='npm install'
  
fi
