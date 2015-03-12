#!/bin/bash

# Get script direcrory.
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Load utils.
source $DIR/utils.sh

#
# Installing zsh files.
#

e_header "ZSH"

# Path to directory where all zsh files 
# will be placed.
ZDOTDIR=$HOME/.zsh

# Zsh-files.
ZSHFILES=(zlogin zlogout zpreztorc zprofile zshenv zshrc)

# Copy all zsh files to ZDOTDIR.
for file in ${ZSHFILES[*]}; do
    \cp -f $DIR/zsh/$file $ZDOTDIR/.$file > /dev/null
    e_note "$file"
done
