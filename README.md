# Dotfiles
Just my configuration files.

# Install

## Debian
```sh
sudo apt-get update

sudo apt-get install git silversearcher-ag subversion tmux zsh

# gawk              - for zplug
# libclang-3.6-dev  - for deoplete-clang
# dconf-cli         - to setup gnome-terminal theme
sudo apt-get install dconf-cli gawk libclang-3.6-dev

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

# Fira font
svn checkout https://github.com/mozilla/Fira/trunk/ttf /tmp/fira
sudo mv /tmp/fira /usr/share/fonts/truetype/
gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Mono 14'

# Gruvbox gnome colors
git clone https://github.com/metalelf0/gnome-terminal-colors /tmp/gnome-terminal-colors
cd /tmp/gnome-terminal-colors && ./install.sh
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
