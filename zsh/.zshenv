# XDG {{{ #

# XDG dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Environment-variable respecting programs
export ANDROID_SDK_HOME="$HOME/.android"
export ANSIBLE_CONFIG="$XDG_CONFIG_HOME/ansible/config.cfg"
export ANSIBLE_PLAYBOOKS="$XDG_DATA_HOME/ansible/playbooks"
export BUNDLE_PATH="$XDG_DATA_HOME/ruby/bundle"
export DOT_SAGE="$XDG_DATA_HOME/sage"
export GEM_HOME="$XDG_DATA_HOME/ruby/gem"
export GEM_PATH="$XDG_DATA_HOME/ruby/gem"
export GEM_SPEC_CACHE="$GEM_HOME/specs"
export GOPATH="$XDG_DATA_HOME/golang:$HOME/Projects/golang"
export GRADLE_USER_HOME="$XDG_CACHE_HOME/gradle"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export LESSHISTFILE="$XDG_DATA_HOME/less/history"
export MSF_CFGROOT_CONFIG="$XDG_DATA_HOME/metasploit"
export MYCLI_HISTFILE="$XDG_DATA_HOME/mycli/history"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql/history"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export RANDFILE="$XDG_DATA_HOME/rnd"
export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME/tmux/plugins"
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export ZPLUG_HOME="$XDG_DATA_HOME/zsh/zplug"

export BABEL_DISABLE_CACHE=1
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Alias respecting programs
alias ag="ag -p $XDG_CONFIG_HOME/ag/agignore"
alias ctags="ctags --config-filename=config/ctags/ctags.conf" # Hack
alias tmux="tmux -f $XDG_CONFIG_HOME/tmux/tmux.conf"
alias ptpython="ptpython --config-dir $XDG_CONFIG_HOME/ptpython"
alias mycli="mycli --myclirc $XDG_CONFIG_HOME/mycli/myclirc"
alias sqlite3="sqlite3 -init $XDG_CONFIG_HOME/sqlite3/sqliterc"
alias wget="wget --hsts-file $XDG_DATA_HOME/wget/hsts"
alias mvn="mvn -gs $XDG_CONFIG_HOME/maven/settings.xml"

# }}} XDG #

# Environment {{{ #
export LANG='en_US.UTF-8'
export LC_ALL=$LANG
export PAGER='less'

if (( $+commands[nvim] )); then
    export EDITOR='nvim'
    export VISUAL='nvim'
else
    export EDITOR='vim'
    export VISUAL='vim'
fi

# Private
source $ZDOTDIR/private.zsh

# Path
typeset -U path
path=(
    $HOME/.local/{bin,sbin}
    /usr/local/{bin,sbin}
    ${${(s<:>)GOPATH}/%//bin}
    $GEM_HOME/bin
    $HOME/Library/Android/sdk/platform-tools
    $HOME/Library/Android/sdk/tools
    /Applications/VNC\ Viewer.app/Contents/MacOS
    $path
)

# Manpath
typeset -U manpath
manpath=(
    $ZPLUG_HOME/doc/man
    /usr/local/share/man
    /usr/share/man
)

# }}} Environment #
