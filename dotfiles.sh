#!/bin/bash

tmux_package=(
  git:tmux-plugins/tpm:.tmux/plugind/tpm
  link:tmux.conf:.tmux.conf
)

vim_package=(
  git:junegunn/vim-plug:.vim/autoload
  link:vimrc:.vimrc
  link:ycm_extra_conf.py:.vim/.ycm_extra_conf.py
  link:UltiSnips:.vim/UltiSnips
)

zsh_package=(
  git:tarjoilija/zgen:.zgen
  link:zshrc:.zshrc
)

misc_package=(
  link:agignore:.agignore
  link:dircolors:.dircolors
  link:radare2rc:.radare2rc
)

actions=(install remove)
packages=($(compgen -A variable | grep _package | sed -e "s/_package//"))
DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

in_array() {
  local e
  for e in "${@:2}"; do
    if [[ "$e" == "$1" ]]; then
      return 0;
    fi
  done
  return 1
}

link_home_file() {
  if [[ ! -h $HOME/$2 ]]; then
    ln -s $DIR/$1 $HOME/$2
  fi
}

unlink_home_file() {
  if [[ -h $HOME/$1 ]]; then
    unlink $HOME/$1
  fi
}

remove_home_dir() {
  if [[ -d $HOME/$1 ]]; then
    rm -rf $HOME/$1
  fi
}

print_help() {
  echo "Usage: $1 <action> <package>"
  echo "<action>: ${actions[@]}"
  echo "<package>: ${packages[@]}"
}

package_install() {
  local package
  local parts
  package=$1[@]
  for line in "${!package}"; do
    parts=(${line//:/ })
    case ${parts[0]} in
      git )
        git clone https://github.com/${parts[1]} $HOME/${parts[2]}
        ;;
      link )
        link_home_file "${parts[1]}" "${parts[2]}"
        ;;
    esac
  done
}

package_remove() {
  local package
  local parts
  package=$1[@]
  for line in "${!package}"; do
    parts=(${line//:/ })
    case ${parts[0]} in
      git )
        remove_home_dir "${parts[2]%/*}"
        ;;
      link )
        unlink_home_file "${parts[2]}"
        ;;
    esac
  done
}

main() {
  if ! in_array "$1" "${actions[@]}"; then
    print_help "$0"
    exit 1
  fi

  if ! in_array "$2" "${packages[@]}"; then
    print_help "$0"
    exit 1
  fi

  package_$1 "$2_package"
}

main "$@"
