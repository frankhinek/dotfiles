#!/bin/zsh

# Don't ask ssh password all the time
git config --global credential.helper osxkeychain

# Better diffs
if which diff-so-fancy > /dev/null 2>&1; then
  git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi
