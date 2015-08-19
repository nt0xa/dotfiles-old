#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# zsh
if [[ ! -d $HOME/.zgen ]]; then
  git clone https://github.com/tarjoilija/zgen $HOME/.zgen
fi

if [[ ! -f $HOME/.zshrc ]]; then
  ln -s $DIR/zshrc $HOME/.zshrc
fi

# tmux
if [[ ! -d $HOME/.tmux ]]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

if [[ ! -f $HOME/.tmux.conf ]]; then
  ln -s $DIR/tmux.conf $HOME/.tmux.conf
fi

# vim
if [[ ! -d $HOME/.vim ]]; then
  git clone https://github.com/junegunn/vim-plug $HOME/.vim/autoload
fi

if [[ ! -f $HOME/.vimrc ]]; then
  ln -s $DIR/vimrc $HOME/.vimrc
fi

if [[ -d $HOME/.vim && ! -f $HOME/.vim/ycm_extra_conf.py ]]; then
  ln -s $DIR/ycm_extra_conf.py $HOME/.vim
fi

