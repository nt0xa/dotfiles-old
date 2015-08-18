# Path {{{ #

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

# Add brew to path on linux.
if [[ "$OSTYPE" == linux* ]]; then
  path=(
    $HOME/.linuxbrew/bin
    $path
  )
fi

# }}} Path #

# Variables {{{ #

export EDITOR='vim'
export GOPATH='~/.go'
export LANG='en_US.UTF-8'
export PAGER='less'
export TERM='xterm-256color'
export VISUAL='vim'

# }}} Variables #

# Plugins {{{ #

source $HOME/.zgen/zgen.zsh

if ! zgen saved; then
  zgen load chriskempson/base16-shell base16-monokai.dark.sh
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load sorin-ionescu/prezto modules/git/functions
  zgen load russtone/prompt-russtone theme.zsh
  zgen load zsh-users/zsh-completions src
  zgen save
fi

# }}} Plugins #

# Key bindings {{{ #

bindkey -v
bindkey -v '^?' backward-delete-char
bindkey -v '^P' up-line-or-history
bindkey -v '^N' down-line-or-history
bindkey -v 'jj' vi-cmd-mode

# }}} Key bindings #

# dircolors {{{ #

if (( $+commands[gdircolors] )); then

  if [[ -s "$HOME/.dir_colors" ]]; then
    eval "$(gdircolors --sh "$HOME/.dir_colors")"
  fi

  alias ls='gls --color=auto --group-directories-first'
fi

# }}} dircolors #

# Aliases {{{ #

# ls aliases
alias l='ls -1A'         # Lists in one column, hidden files
alias ll='ls -lh'        # Lists human readable sizes
alias lr='ll -R'         # Lists human readable sizes, recursively
alias la='ll -A'         # Lists human readable sizes, hidden files
alias lk='ll -Sr'        # Lists sorted by size, largest last
alias lt='ll -tr'        # Lists sorted by date, most recent last

# }}} Aliases #

# Helpers {{{ #

autoload colors && colors

function redraw-prompt {
  local precmd_func
  for precmd_func in $precmd_functions; do
    $precmd_func
  done
  zle reset-prompt
}
zle -N redraw-prompt

# }}} Helpers #

# Completions {{{ #

# Case insensetive completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# }}} Completions #

# History {{{ #

# Variables
HISTFILE="$HOME/.zhistory"       # The path to the history file.
HISTSIZE=10000                   # The maximum number of events to save in the internal history.
SAVEHIST=10000                   # The maximum number of events to save in the history file.

# Options
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# }}} History #

# tmux {{{ #

# Return if requirements are not found
if (( ! $+commands[tmux] )); then
  echo "$fg_bold[yellow]Warning: tmux command not found!"
  return 1
fi

if [[ -z "$TMUX" && -z "$EMACS" && -z "$VIM" ]];  then
  tmux start-server
  if ! tmux has-session 2> /dev/null; then
    tmux_session='russtone'
    tmux \
      new-session -d -s "$tmux_session" \; \
      set-option -t "$tmux_session" destroy-unattached off &> /dev/null
  fi

  # Attach to the 'russtone' session or to the last session used
  exec tmux attach-session
fi

# }}} tmux #

# fzf {{{ #

# Return if requirements are not found
if (( !$+commands[fzf] )); then
  echo "$fg_bold[yellow]Warning: fzf command not found!$reset_color"
  return 1
fi

# If tmux installed use fzf in tmux pane
if (( $+commands[tmux] )); then
  export fzf_cmd='fzf-tmux -d 20%'
else
  export fzf_cmd='fzf'
fi

# Ctrl-F - Jump to selected directory
function fzf-change-directory {
  local dir
  dir=$(find $HOME \
    -path '*/\.*' -prune \
    -o -name 'node_modules' -prune \
    -o -name 'Library' -prune \
    -o -name 'Applications' -prune \
    -o -type d -print \
    2> /dev/null | \
    eval "$fzf_cmd +m -q '$LBUFFER'") && \
    cd $dir
  zle kill-whole-line
  zle redraw-prompt
}
zle -N fzf-change-directory
bindkey '^F' fzf-change-directory

# Ctrl-R - Paste the selected command from history into the command line
function fzf-history-widget {
  local selected restore_no_bang_hist
  if selected=( $(fc -l 1 | eval "$fzf_cmd +s --tac +m -n2..,.. --tiebreak=index --toggle-sort=ctrl-r -q '$LBUFFER'") ); then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle redraw-prompt
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget



# }}} fzf #
