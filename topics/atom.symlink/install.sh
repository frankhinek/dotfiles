#!/bin/sh
if test "$(which apm)"; then
  #apm upgrade --confirm false

  apm_packages="
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
    sublime-style-column-selection
  "

  for package in $apm_packages; do
    if [[ ! -d "$HOME/.atom/packages/$package" ]]; then
      apm install "$package"
    fi
  done

  apm_packages="
    metrics
    exception-reporting
  "
  for package in $apm_packages; do
    if [[ -d "$HOME/.atom/packages/$package" ]]; then
      apm remove "$package"
    fi
  done
fi
