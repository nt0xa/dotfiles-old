#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

function dotfiles_install_misc() {
  if [[ ! -f $HOME/.dircolors ]]; then
    ln -s $DIR/dircolors $HOME/.dircolors
  fi

  if [[ ! -f $HOME/.agignore ]]; then
    ln -s $DIR/agignore $HOME/.agignore
  fi

  if [[ ! -f $HOME/.radare2rc ]]; then
    ln -s $DIR/radare2rc $HOME/.radare2rc
  fi
}

function dotfiles_remove_misc() {
  if [[ -f $HOME/.dircolors ]]; then
    unlink $HOME/.dircolors
  fi

  if [[ -f $HOME/.agignore ]]; then
    unlink $HOME/.agignore
  fi

  if [[ -f $HOME/.radare2rc ]]; then
    unlink $HOME/.radare2rc
  fi
}

function dotfiles_install_zsh() {
  if [[ ! -d $HOME/.zgen ]]; then
    git clone https://github.com/tarjoilija/zgen $HOME/.zgen
  fi

  if [[ ! -f $HOME/.zshrc ]]; then
    ln -s $DIR/zshrc $HOME/.zshrc
  fi

  if [[ ! -f $HOME/.dircolors ]]; then
    ln -s $DIR/dircolors $HOME/.dircolors
  fi

  if [[ ! -f $HOME/.agignore ]]; then
    ln -s $DIR/agignore $HOME/.agignore
  fi
}

function dotfiles_remove_zsh() {
  if [[ -d $HOME/.zgen ]]; then
    rm -rf $HOME/.zgen
  fi

  if [[ -f $HOME/.zshrc ]]; then
    unlink $HOME/.zshrc
  fi

  if [[ -f $HOME/.dircolors ]]; then
    unlink $HOME/.dircolors
  fi

  if [[ -f $HOME/.agignore ]]; then
    unlink $HOME/.agignore
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

  if [[ -d $HOME/.vim && ! -f $HOME/.vim/.ycm_extra_conf.py ]]; then
    ln -s $DIR/ycm_extra_conf.py $HOME/.vim/.ycm_extra_conf.py
  fi

  if [[ -d $HOME/.vim && ! -f $HOME/.vim/UltiSnips ]]; then
    ln -s $DIR/UltiSnips $HOME/.vim/UltiSnips
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

      misc )
        dotfiles_install_misc
        ;;

      all )
        dotfiles_install_zsh
        dotfiles_install_tmux
        dotfiles_install_vim
        dotfiles_install_misc
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

      misc )
        dotfiles_remove_misc
        ;;

      all )
        dotfiles_remove_zsh
        dotfiles_remove_tmux
        dotfiles_remove_vim
        dotfiles_remove_misc
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
