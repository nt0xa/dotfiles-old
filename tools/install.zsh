#!/bin/zsh

set -e

e_header "ZSH"

# Path to directory with all zsh files
ZDOTDIR=$HOME/.dotfiles/zsh

# Check existance of ~/.zsh directory.
if [ -d "$ZDOTDIR" ]; then
    seek_confirmation "~/.zsh already exist. Do you want to rewrite it?"
    if ! is_confirmed; then
        exit 1
    fi

    # Remove existant .zsh
    \rm -rf $ZDOTDIR
fi

# Create ~/.zsh directory.
mkdir $ZDOTDIR

# Copy prezto repo to ~/.zsh
e_note "==> Copy prezto repo to ~/.zsh/.zprezto"

rsync -r --links $DIR/zsh/prezto/ $ZDOTDIR/.zprezto
e_success "ok"

# Zsh-files.
ZSHFILES=(zlogin zlogout zpreztorc zprofile zshenv zshrc)

# Copy all zsh files to ZDOTDIR.
e_note "==> Copy all zsh files to ~/.zsh"

for file in ${ZSHFILES[*]}; do
    if [[ -f $DIR/zsh/$file ]]; then
        cp $DIR/zsh/$file $ZDOTDIR/.$file
    else
        ln -s $ZDOTDIR/.zprezto/runcoms/$file $ZDOTDIR/.$file
    fi
    e_success ".$file"
done

# Create .zshenv file in home directory 
# that will source ~/.zsh/.zshenv
e_note "==> Create ~/.zshenv"

if [ -f "$HOME/.zshenv" ]; then
    rm -f $HOME/.zshenv
fi

cat > $HOME/.zshenv <<EOL
export ZDOTDIR=$HOME/.zsh
source $ZDOTDIR/.zshenv
EOL

e_success "ok"
