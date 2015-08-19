#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function dotfiles_install_zsh() {
  if [[ ! -d $HOME/.zgen ]]; then
    git clone https://github.com/tarjoilija/zgen $HOME/.zgen
  fi

  if [[ ! -f $HOME/.zshrc ]]; then
    ln -s $DIR/zshrc $HOME/.zshrc
  fi
}

function dotfiles_remove_zsh() {
  if [[ -d $HOME/.zgen ]]; then
    rm -rf $HOME/.zgen
  fi

  if [[ -f $HOME/.zshrc ]]; then
    unlink $HOME/.zshrc
  fi
}

function dotfiles_install_tmux() {
  if [[ ! -d $HOME/.tmux ]]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
  fi

  if [[ ! -f $HOME/.tmux.conf ]]; then
    ln -s $DIR/tmux.conf $HOME/.tmux.conf
  fi
}

function dotfiles_remove_tmux() {
  if [[ -d $HOME/.tmux ]]; then
    rm -rf $HOME/.tmux
  fi

  if [[ -f $HOME/.tmux.conf ]]; then
    unlink $HOME/.tmux.conf
  fi
}

function dotfiles_install_vim() {
  if [[ ! -d $HOME/.vim ]]; then
    git clone https://github.com/junegunn/vim-plug $HOME/.vim/autoload
  fi

  if [[ ! -f $HOME/.vimrc ]]; then
    ln -s $DIR/vimrc $HOME/.vimrc
  fi

  if [[ -d $HOME/.vim && ! -f $HOME/.vim/ycm_extra_conf.py ]]; then
    ln -s $DIR/ycm_extra_conf.py $HOME/.vim
  fi
}

function dotfiles_remove_vim() {
  if [[ -d $HOME/.vim ]]; then
    rm -rf $HOME/.vim
  fi

  if [[ -f $HOME/.vimrc ]]; then
    unlink $HOME/.vimrc
  fi
}

function dotfiles_install() {
    case $1 in

      zsh )
        dotfiles_install_zsh
        ;;

      tmux )
        dotfiles_install_tmux
        ;;

      vim )
        dotfiles_install_vim
        ;;

      all )
        dotfiles_install_zsh
        dotfiles_install_tmux
        dotfiles_install_vim
        ;;

      * )
        echo "Unknown target $1"
        return 1
        ;;

    esac
}

function dotfiles_remove() {
    case $1 in

      zsh )
        dotfiles_remove_zsh
        ;;

      tmux )
        dotfiles_remove_tmux
        ;;

      vim )
        dotfiles_remove_vim
        ;;

      all )
        dotfiles_remove_zsh
        dotfiles_remove_tmux
        dotfiles_remove_vim
        ;;

      * )
        echo "Unknown target $1"
        return 1
        ;;

    esac
}

function dotfiles_main() {
  case $1 in

    install )
      dotfiles_install $2
      ;;

    remove )
      dotfiles_remove $2
      ;;

    * )
      echo "Unknown command $1"
      return 1
      ;;

  esac
}

dotfiles_main "$@"
