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
  zgen load zsh-users/zsh-history-substring-search
  zgen load russtone/prompt-russtone theme.zsh
  zgen load zsh-users/zsh-completions src
  zgen save
fi

# }}} Plugins #

# Key bindings {{{ #

bindkey -v
bindkey '^?' backward-delete-char
bindkey -M viins '^P' history-substring-search-up
bindkey -M viins '^N' history-substring-search-down
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# }}} Key bindings #

# dircolors {{{ #

if (( $+commands[gdircolors] )); then

  if [[ -s "$HOME/.dircolors" ]]; then
    eval "$(gdircolors --sh "$HOME/.dircolors")"
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
  echo "Warning: tmux command not found!"
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
