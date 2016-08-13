#!/bin/sh
# GRC colorizes nifty unix tools all over the place
if which grc >/dev/null 2>&1 && which brew >/dev/null 2>&1; then
  . "$(brew --prefix)/etc/grc.bashrc"
fi
