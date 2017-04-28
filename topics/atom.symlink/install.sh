#!/bin/zsh
if test "$(which apm)"; then
  apm upgrade --confirm false

  apm install --packages-file ~/.dotfiles/topics/atom.symlink/packages.txt || true

  apm_packages="
    metrics
    exception-reporting
  "
  for package in $apm_packages; do
    apm remove "$package" || true
  done
fi
