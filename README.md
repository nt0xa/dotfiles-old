# Dotfiles
Just my configuration files.

# Install

## Common
```sh
# Clone
git clone git@github.com:russtone/dotfiles.git ~/.config

# Set $ZDOTDIR
echo 'export ZDOTDIR="$HOME/.config/zsh"' | sudo tee /etc/zshenv > /dev/null
```

## Debian
```sh
sudo apt-get update
sudo apt-get install gawk git silversearcher-ag tmux zsh

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
# Set OS X environment variables
mkdir ~/Library/LaunchAgents
ln -s ~/.config/osx/environment.plist ~/Library/LaunchAgents/environment.plist
```

## Misc

### zplug, tpm, vim-plug
```sh
zplug install
tmx
I
nvim -c ':PlugInstall " :UpdateRemotePlugins'
```

### deoplete-clang
```sh
sudo apt-get install libclang-3.6-dev
```
