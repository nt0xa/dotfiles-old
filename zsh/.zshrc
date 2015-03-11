#
# Executes commands at the start of an interactive session.
#

# Set ZDOTDIR.
export ZDOTDIR=$HOME/.zsh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
