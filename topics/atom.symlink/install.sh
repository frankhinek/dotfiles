#!/bin/zsh
if test "$(which apm)"; then
  apm upgrade --confirm false

  apm_packages="
    Sublime-Style-Column-Selection
    advanced-open-file
    asciidoc-image-helper
    asciidoc-preview
    atom-beautify
    atom-material-syntax
    atom-material-ui
    atom-smart-template
    atom-ternjs
    autocomplete-asciidoc
    autocomplete-modules
    autocomplete-paths
    busy-signal
    editorconfig
    file-icons
    git-plus
    intentions
    language-asciidoc
    language-babel
    language-terraform
    linter
    linter-eslint
    linter-terraform-syntax
    linter-ui-default
    pigments
  "

  for package in $apm_packages; do
    apm list | grep -q "$module" || apm install "$module"
  done

  apm_packages="
    metrics
    exception-reporting
  "
  for package in $apm_packages; do
    apm list | grep -q "$module" || apm remove "$module"
  done
fi
