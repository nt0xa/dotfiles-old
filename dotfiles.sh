#!/bin/bash

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

tmux_package=(
  git:tmux-plugins/tpm:$HOME/.tmux/plugins/tpm
  link:$DIR/tmux.conf:$HOME/.tmux.conf
)

vim_package=(
  git:junegunn/vim-plug:$HOME/.vim/autoload
  link:$DIR/vimrc:$HOME/.vimrc
  link:$DIR/ycm_extra_conf.py:$HOME/.vim/.ycm_extra_conf.py
  link:$DIR/UltiSnips:$HOME/.vim/UltiSnips
  link:$HOME/.vim:$HOME/.config/nvim
  link:$DIR/vimrc:$HOME/.config/nvim/init.vim
)

zsh_package=(
  git:tarjoilija/zgen:$HOME/.zgen
  link:$DIR/zshrc:$HOME/.zshrc
)

misc_package=(
  link:$DIR/agignore:$HOME/.agignore
  link:$DIR/config.py:$HOME/.ptpython/config.py
  link:$DIR/dircolors:$HOME/.dircolors
  link:$DIR/gitconfig:$HOME/.gitconfig
  link:$DIR/radare2rc:$HOME/.radare2rc
  link:$DIR/todo.cfg:$HOME/.todo/config
  link:$DIR/ideavimrc:$HOME/.ideavimrc
)

all=($(compgen -A variable | grep _package))
all_package=()
for p in "${all[@]}"; do
  tmp=$p[@]
  for a in "${!tmp}"; do
    all_package+=("$a")
  done
done

actions=(install remove)
packages=($(compgen -A variable | grep _package | sed -e "s/_package//"))

in_array() {
  local e
  for e in "${@:2}"; do
    if [[ "$e" == "$1" ]]; then
      return 0;
    fi
  done
  return 1
}

link_file() {
  if [[ ! -d $(dirname "$2") ]]; then
    mkdir -p $(dirname "$2")
  fi
  if [[ ! -h $2 ]]; then
    ln -s $1 $2
  fi
}

unlink_file() {
  if [[ -h $1 ]]; then
    unlink $1
  fi
}

remove_dir() {
  if [[ -d $1 ]]; then
    rm -rf $1
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
        git clone https://github.com/${parts[1]} ${parts[2]}
        ;;
      link )
        link_file "${parts[1]}" "${parts[2]}"
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
        remove_dir "${parts[2]%%/*}"
        ;;
      link )
        unlink_file "${parts[2]}"
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
