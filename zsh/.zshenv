#	XDG {{{ #

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
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"

# Alias respecting programs
alias ag="ag -p $XDG_CONFIG_HOME/ag/agignore"
alias ctags="ctags --config-filename=config/ctags/ctags.conf" # Hack
alias rsyncs="rsync -e \"ssh -F $XDG_CONFIG_HOME/ssh/config\""
alias scp="scp -F $XDG_CONFIG_HOME/ssh/config"
alias ssh="ssh -F $XDG_CONFIG_HOME/ssh/config"
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
alias ptpython="ptpython --config-dir $XDG_CONFIG_HOME/ptpython"

#	}}} XDG #

#	Environment {{{ #

export LANG='en_US.UTF-8'
export PAGER='less'

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

# Manpath
typeset -U manpath
manpath=(
	$ZPLUG_HOME/doc/man
	/usr/local/share/man
	/usr/share/man
)

#	}}} Environment #
