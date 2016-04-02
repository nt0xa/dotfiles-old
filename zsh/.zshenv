# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# zplug
export ZPLUG_HOME="$XDG_DATA_HOME/zsh/zplug"

# TPM
export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME/tmux/plugins"

# Common
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# Language
export LANG='en_US.UTF-8'

# Terminal
export TERM='xterm-256color'

# Terminfo
# export TERMINFO="$XDG_CONFIG_HOME/.terminfo"

# Golang
export GOPATH="$XDG_DATA_HOME/golang"

# Path
path=(
  /usr/local/{bin,sbin}
  $GOPATH/bin
  $path
)
