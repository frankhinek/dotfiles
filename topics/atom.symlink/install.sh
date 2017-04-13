#!/bin/zsh
if test "$(which apm)"; then
  apm upgrade --confirm false

  apm install --packages-file ~/.dotfiles/atom.symlink/packages.txt || true

  modules="
    metrics
    exception-reporting
  "
  for module in $modules; do
    apm remove "$module" || true
  done
fi
