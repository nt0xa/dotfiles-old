# Dotfiles
Just my configuration files.

# Install
```sh
# Clone
git clone git@github.com:russtone/dotfiles.git ~/.config

# Set $ZDOTDIR
echo 'export ZDOTDIR="$HOME/.config/zsh"' | sudo tee /etc/zshenv > /dev/null

# Set OS X environment variables
mkdir ~/Library/LaunchAgents
ln -s ~/.config/osx/environment.plist ~/Library/LaunchAgents/environment.plist
```
