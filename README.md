# Dotfiles
Just my configuration files.

# Install

## Debian / Fedora

#### Install needed packages
```sh
# Debian
sudo apt-get update
sudo apt-get install build-essential
sudo apt-get install git subversion

# Fedora
sudo dnf update
sudo dnf groupinstall -y "C Development Tools and Libraries" "Development Tools"
sudo dnf install -y git subversion ruby
```

#### Install Linuxbrew
```sh
cd ~/.local
git init
git remote add origin https://github.com/Linuxbrew/brew
git fetch origin
git checkout -b master --track origin/master
```

#### Install configs
```sh
cd ~/.config
git init
git remote add origin https://github.com/russtone/dotfiles
git fetch origin
git checkout -b master --track origin/master
```

#### Generate ssh-key
```sh
ssh-keygen

# Add key to github account
cat ~/.ssh/id_rsa.pub
```

#### Install brew packages
```sh
# Fedora workaround
sudo dnf install perl-Storable
```

```sh
export PATH=$PATH:$HOME/.local/bin
brew tap Homebrew/bundle
cd ~/.config
brew bundle -v
```

#### Zsh
```sh
# Debian workaround
sudo apt-get install gawk
```

```sh
echo 'export ZDOTDIR="$HOME/.config/zsh"' | sudo tee -a /etc/zshenv > /dev/null
echo "$HOME/.local/bin/zsh" | sudo tee -a /etc/shells > /dev/null
chsh -s $HOME/.local/bin/zsh <user>
zplug install
```

#### Tmux
```sh
tmx
<prefix>I
```

#### Neovim
```sh
# Debian
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get install libclang-3.6-dev

# Fedora
sudo dnf install redhat-rpm-config python-devel python3-devel
sudo dnf install xclip
sudo dnf install clang-devel
```

```sh
pip3 install neovim
nvim -c ':PlugInstall | :UpdateRemotePlugins'
```

#### Fira font
```sh
svn checkout https://github.com/mozilla/Fira/trunk/ttf /tmp/fira
sudo mv /tmp/fira /usr/share/fonts/truetype/
gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Mono 14'
```


#### Gruvbox gnome colors
```sh
# Debian
sudo apt-get install dconf-cli
```

```sh
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
