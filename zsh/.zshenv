# ZDOTDIR {{{ #

export ZDOTDIR=$HOME/.zsh

# }}} ZDOTDIR #

# Terminal {{{ #

export TERM='xterm-256color'

# }}} Terminal #

# Editors {{{ #

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# }}} Editors #

# Language {{{ #

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# }}} Language #

# Path {{{ #

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

# }}} Path #

# Temp files {{{ #

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

# }}} Temp files #
