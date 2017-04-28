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
    apm list | grep "$package" > /dev/null 2>&1 || apm install "$package""
  done

  apm_packages="
    metrics
    exception-reporting
  "
  for package in $apm_packages; do
    apm list | grep "$package" > /dev/null 2>&1 || apm remove "$package"
  done
fi
