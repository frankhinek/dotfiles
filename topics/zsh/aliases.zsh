#!/bin/zsh
__reload_dotfiles() {
  PATH="$(command -p getconf PATH):/usr/local/bin"
  . ~/.zshrc
  cd . || return 1
}
alias reload!='__reload_dotfiles'
