#!/bin/zsh

# Get script direcrory.
DIR=${0:a:h}

# Load utils.
source $DIR/utils.zsh

#
# Installing zsh files.
#

e_header "ZSH"

# Path to directory where all zsh files 
# will be placed.
ZDOTDIR=$HOME/.zsh

# Check ~/.zsh directory.
if [ -d "$ZDOTDIR" ]; then
    seek_confirmation "~/.zsh already exist. Do you want to rewrite it?"
    if ! is_confirmed; then
        exit 1
    fi
    printf "\n"
fi

# Zsh-files.
ZSHFILES=(zlogin zlogout zpreztorc zprofile zshenv zshrc)

# Copy prezto repo to ~/.zsh
e_note "==> Copy prezto repo to ~/.zsh/.zprezto"
\cp -rf $DIR/zsh/prezto $ZDOTDIR
if [ $? -eq 0 ]; then
    e_success "done"
else
    e_error "fail"
fi
printf "\n"

# Copy all zsh files to ZDOTDIR.
e_note "==> Copy all zsh files to ~/.zsh"

for file in ${ZSHFILES[*]}; do
    \cp -f $DIR/zsh/$file $ZDOTDIR/.$file > /dev/null
    if [ $? -eq 0 ]; then
        e_success ".$file"
    else
        e_error ".$file"
    fi
done
