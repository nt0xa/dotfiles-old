# Dotfiles
Just my configuration files.

# Install

## Debian
```sh
sudo apt-get update
# gawk              - for zplug
# libclang-3.6-dev  - for deoplete-clang
sudo apt-get install gawk git libclang-3.6-dev silversearcher-ag tmux zsh

# Experimental
echo 'deb http://httpredir.debian.org/debian experimental main' | sudo tee -a /etc/apt/sources.list > /dev/null
sudo apt-get update
sudo apt-get -t experimental install libmsgpackc2 neovim

# Clone configs
git clone git@github.com:russtone/dotfiles.git ~/.config

# Set $ZDOTDIR
echo 'export ZDOTDIR="$HOME/.config/zsh"' | sudo tee -a /etc/zsh/zshenv > /dev/null

# Change default shell
chsh -s /usr/bin/zsh <user>
```

## macOS
```sh
# Clone
git clone git@github.com:russtone/dotfiles.git ~/.config

# Set $ZDOTDIR
echo 'export ZDOTDIR="$HOME/.config/zsh"' | sudo tee /etc/zshenv > /dev/null

# Set OS X environment variables
mkdir ~/Library/LaunchAgents
ln -s ~/.config/osx/environment.plist ~/Library/LaunchAgents/environment.plist
```

# Plugins

## zplug, tpm, vim-plug
```sh
# zplug
zplug install

# tmux
tmx
<prefix>I

# neovim
nvim -c ':PlugInstall | :UpdateRemotePlugins'
```
