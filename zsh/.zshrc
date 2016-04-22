#  XDG {{{ #

# XDG dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Environment-variable respecting programs
export ADB_VENDOR_KEYS="$XDG_DATA_HOME/android/.android"
export ANDROID_SDK_HOME="$XDG_DATA_HOME/android"
export GIT_SSH_COMMAND="ssh -F $XDG_CONFIG_HOME/ssh/config "$@" 2>/dev/null"
export GOPATH="$XDG_DATA_HOME/golang"
export GRADLE_USER_HOME="$XDG_CACHE_HOME/gradle"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export LESSHISTFILE="$XDG_DATA_HOME/less/history"
export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME/tmux/plugins"
export ZPLUG_HOME="$XDG_DATA_HOME/zsh/zplug"

# zcompdump
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Alias respecting programs
alias ag="ag -p $XDG_CONFIG_HOME/ag/agignore"
alias rsyncs="rsync -e \"ssh -F $XDG_CONFIG_HOME/ssh/config\""
alias scp="scp -F $XDG_CONFIG_HOME/ssh/config"
alias ssh="ssh -F $XDG_CONFIG_HOME/ssh/config"
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"

#  }}} XDG #

#  Environment {{{ #

export LANG='en_US.UTF-8'
export PAGER='less'
export TERM='xterm-256color'

if (( $+commands[nvim] )); then
  export EDITOR='nvim'
  export VISUAL='nvim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi

# Path
typeset -U path
path=(
  $HOME/.local/bin
  /usr/local/{bin,sbin}
  $GOPATH/bin
  $HOME/Library/Android/sdk/platform-tools
  $path
)

#  }}} Environment #

# Plugins {{{ #

# Auto install zplug
if [[ ! -s $ZPLUG_HOME/zplug ]]; then
  curl -fLo $ZPLUG_HOME/zplug \
    --create-dirs https://raw.githubusercontent.com/b4b4r07/zplug/master/zplug
fi

source $ZPLUG_HOME/zplug

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", nice:11
zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug "$ZDOTDIR", of:clipboard.zsh, from:local
zplug "$ZDOTDIR", of:prompt.zsh, from:local

zplug load

# }}} Plugins #

# Key bindings {{{ #

bindkey -e
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# }}} Key bindings #

# Dircolors {{{ #

if (( $+commands[gdircolors] )); then
  dircolors_cmd='gdircolors'
elif (( $+commands[dircolors] )); then
  dircolors_cmd='dircolors'
fi

if [[ ! -z $dircolors_cmd ]]; then
  eval "$($dircolors_cmd --sh "$XDG_CONFIG_HOME/dircolors/dircolors")"
fi

# }}} Dircolors #

# Aliases {{{ #

alias ll='ls -lh'        # Lists human readable sizes
alias lr='ll -R'         # Lists human readable sizes, recursively
alias la='ll -A'         # Lists human readable sizes, hidden files
alias cd='cd -P'         # Change $PWD when cd to symlink
alias p='python'
alias pp='ptpython'
alias v='nvim'

if (( $+commands[gls] )); then
  ls_cmd='gls'
else
  ls_cmd='ls'
fi
alias ls="$ls_cmd --color=auto --group-directories-first"

# }}} Aliases #

# Completions {{{ #

# Case insensetive completion
zstyle ':completion:*' matcher-list \
  'm:{[:lower:]}={[:upper:]}'\
  'm:{[:upper:]}={[:lower:]}'

# Use cache
zstyle ':completion::complete:*' use-cache on

# Cache file path
zstyle ':completion::complete:*' cache-path "$XDG_CACHE_HOME/zsh/zcompcache"

# Use menu if more than one result
zstyle ':completion:*:*:*:*:*' menu select

# Format of group name
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'

# Colors in completion menu
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# }}} Completions #

# History {{{ #

# Variables
HISTSIZE=100000
SAVEHIST=100000

# Options
setopt SHARE_HISTORY             # Share history between all sessions
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file
setopt HIST_VERIFY               # Do not execute immediately upon history expansion

# }}} History #

# Custom functions & widgets {{{ #

# Tmux {{{ #

function tmx() {
  local global='global'
  local client=$(date +%Y%m%d%H%M%S)

  if (( ! $+commands[tmux] )); then
    echo "Warning: 'tmux' command not found!"
    return 1
  fi

  if [[ -z "$TMUX" && -z "$SSH_TTY" ]];  then

    if ! tmux has-session 2> /dev/null; then
      tmux new-session -d -s $global
    fi

    exec tmux new-session -d -t $global -s $client \; set-option destroy-unattached \; attach-session -t $client
  fi
}

# }}} Tmux #

# Expand .. {{{ #

# Expands .... to ../..
function expand-dot-to-parent-directory-path() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+='/..'
  else
    LBUFFER+='.'
  fi
}
zle -N expand-dot-to-parent-directory-path
bindkey -M viins '.' expand-dot-to-parent-directory-path

# }}} Expand .. #

#  Copy & paste {{{ #

if (( $+functions[clipcopy] )); then
  function clip-copy-region-as-kill() {
    zle copy-region-as-kill
    print -rn $CUTBUFFER | clipcopy
  }
  zle -N clip-copy-region-as-kill
  bindkey '^W' clip-copy-region-as-kill
fi

if (( $+functions[clippaste] )); then
  function clip-yank() {
    CUTBUFFER=$(clippaste)
    zle yank
  }
  zle -N clip-yank
  bindkey '^Y' clip-yank
fi

#  }}} Copy & paste #

#  FZF {{{ #

if (( $+commands[fzf] )); then

  # Color scheme
  export FZF_DEFAULT_OPTS='
    --color fg:7,bg:0,hl:3,fg+:3,bg+:0,hl+:3
    --color info:7,prompt:2,spinner:208,pointer:4,marker:3
  '

  # Use ag if possible
  if (( $+commands[ag] )); then
    export FZF_DEFAULT_COMMAND='ag -g ""'
  fi

  # Select file
  __fsel() {
    local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . \\( -path '*/\\.*' -o -fstype 'dev' -o -fstype 'proc' \\) -prune \
      -o -type f -print \
      -o -type d -print \
      -o -type l -print 2> /dev/null | sed 1d | cut -b3-"}"
    eval "$cmd" | fzf -m | while read item; do
      printf '%q ' "$item"
    done
    echo
  }

  fzf-file-widget() {
    LBUFFER="${LBUFFER}$(__fsel)"
    zle redisplay
  }

  zle -N fzf-file-widget
  bindkey '^T' fzf-file-widget
fi


#  }}} FZF #

#  }}} Custom functions & widgets #

# vim: fdm=marker
