#!/bin/zsh
alias gl='git pull --prune'
alias glg="git log --graph --decorate --oneline --abbrev-commit"
alias glga="glg --all"
alias gp='git push origin HEAD'
alias gpa='git push origin --all'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gcf='git commit --fixup'
alias gco='git checkout'
alias gb='git branch'
alias ga='git add'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gcam='git commit -a -m'
alias gs='git status -sb'
alias gcl='git clone'

gi() {
  curl -s "https://www.gitignore.io/api/$*";
}
