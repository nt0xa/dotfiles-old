#!/bin/bash

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)
CONFIG_HOME="$HOME/.config"

tmux_package=(
  $DIR/tmux/tmux.conf:$CONFIG_HOME/tmux/tmux.conf
)

nvim_package=(
  $DIR/nvim/init.vim:$CONFIG_HOME/nvim/init.vim
  $DIR/nvim/UltiSnips:$CONFIG_HOME/nvim/UltiSnips
)

zsh_package=(
  $DIR/zsh/zshrc:$CONFIG_HOME/zsh/.zshrc
)

misc_package=(
  $DIR/misc/agignore:$HOME/.agignore
  $DIR/misc/ptpython_config.py:$HOME/.ptpython/config.py
  $DIR/misc/dircolors:$HOME/.dircolors
  $DIR/misc/gitconfig:$HOME/.gitconfig
  $DIR/misc/ideavimrc:$HOME/.ideavimrc
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
    link_file "${parts[0]}" "${parts[1]}"
  done
}

package_remove() {
  local package
  local parts
  package=$1[@]
  for line in "${!package}"; do
    parts=(${line//:/ })
    unlink_file "${parts[1]}"
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
