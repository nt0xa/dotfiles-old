# Set ZDOTDIR.
export ZDOTDIR=$HOME/.zsh

if [ ! -d "$ZDOTDIR/.zprezto" ]; then
    # Clone prezto repo.
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "$ZDOTDIR/.zprezto"
fi

# Script directory.
DIR=${0:a:h}

# Create a new zsh configuration by copying
# the zsh configuration files provided.
yes | cp -rf $DIR/zsh/.* $ZDOTDIR >/dev/null

# Create .zshenv file in home folder.
if [ ! -d "$HOME/.zshenv" ]; then
    cat > $HOME/.zshenv <<EOL
export ZDOTDIR=$HOME/.zsh
source $ZDOTDIR/.zshenv
EOL
fi
