#!/bin/zsh
export LSCOLORS='exfxcxdxbxegedabagacad'
export CLICOLOR=true

fpath=($DOTFILES_ROOT/topics/functions $fpath)

autoload -U "$DOTFILES_ROOT"/topics/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# don't nice background tasks
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_LIST_BEEP
# allow functions to have local options
setopt LOCAL_OPTIONS
# allow functions to have local traps
setopt LOCAL_TRAPS
# share history between sessions ???
setopt SHARE_HISTORY
# add timestamps to history
setopt EXTENDED_HISTORY
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
# adds history
setopt APPEND_HISTORY
# adds history incrementally and share it across sessions
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
# don't record dupes in history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt HIST_EXPIRE_DUPS_FIRST
# dont ask for confirmation in rm globs*
setopt RM_STAR_SILENT

## NOT CURRENTLY BEING USED ####################################################
# # Use emacs key bindings
# bindkey -e
#
# # [Ctrl-r] - Search backward incrementally for a specified string.
# # The string may begin with ^ to anchor the search to the beginning of the line.
# bindkey '^r' history-incremental-search-backward
# # [PageUp] - Up a line of history
# if [[ ! -z "$terminfo[kpp]" ]]; then
#   bindkey "$terminfo[kpp]" up-line-or-history
# fi
# # [PageDown] - Down a line of history
# if [[ ! -z "$terminfo[knp]" ]]; then
#   bindkey "$terminfo[knp]" down-line-or-history
# fi

# [Ctrl-P] - Up a line of history
bindkey '^P' up-line-or-history

# [Ctrl-N] - Down a line of history
bindkey '^N' up-line-or-history

# start typing + [Up-Arrow] - fuzzy find history forward
bindkey '^[[A' history-substring-search-up

# start typing + [Down-Arrow] - fuzzy find history backward
bindkey '^[[B' history-substring-search-down

# [Alt-RightArrow] - move forward one word
bindkey '^[^[[D' backward-word

# [Alt-RightArrow] - move forward one word
bindkey '^[^[[C' forward-word

# [Ctrl-A] - Go to beginning of line
bindkey '^A' beginning-of-line

# [Home] - Go to beginning of line
if [[ ! -z "$terminfo[khome]" ]]; then
  bindkey "$terminfo[khome]" beginning-of-line
fi

# [Ctrl-E] - Go to end of line
bindkey '^E' end-of-line

# [End] - Go to end of line
if [[ ! -z "$terminfo[kend]" ]]; then
  bindkey "$terminfo[kend]"  end-of-line
fi

# [fn-Delete] - delete forward
bindkey '^[[3~' delete-char

# [Backspace] - delete backward
bindkey '^?' backward-delete-char

# # [Shift-Tab] - move through the completion menu backwards
if [[ ! -z "$terminfo[kcbt]" ]]; then
  bindkey "$terminfo[kcbt]" reverse-menu-complete
fi

# if [[ ! -z "$terminfo[khome]" ]]; then
#   # [Home] - Go to beginning of line
#   bindkey "$terminfo[khome]" beginning-of-line
#   # OPTION+left
#   bindkey '[D' beginning-of-line
# fi
# if [[ ! -z "$terminfo[kend]" ]]; then
#   # [End] - Go to end of line
#   bindkey "$terminfo[kend]"  end-of-line
#   # OPTION+right
#   bindkey '[C' end-of-line
# fi
#
# # [Ctrl-RightArrow] - move forward one word
# bindkey '^[[1;5C' forward-word
# # [Ctrl-LeftArrow] - move backward one word
# bindkey '^[[1;5D' backward-word
# # [Shift-Tab] - move through the completion menu backwards
# if [[ ! -z "$terminfo[kcbt]" ]]; then
#   bindkey "$terminfo[kcbt]" reverse-menu-complete
# fi
# # [Backspace] - delete backward
# bindkey '^?' backward-delete-char
# # [Delete] - delete forward
# if [[ ! -z "$terminfo[kdch1]" ]]; then
#   bindkey "$terminfo[kdch1]" delete-char
# else
#   bindkey "^[[3~" delete-char
#   bindkey "^[3;5~" delete-char
#   bindkey "\e[3~" delete-char
# fi
