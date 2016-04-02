# Dotfiles
Just my configuration files.

# Install
```
# Clone
git clone git@github.com:russtone/dotfiles.git ~/.config

# Set $ZDOTDIR
echo 'export ZDOTDIR="$HOME/.config/zsh"' | sudo tee /etc/zshenv > /dev/null

# Set OS X environment variables
ln -s $XDG_CONFIG_PATH/osx/environmet.plist $HOME/Library/LaunchAgents/environment.plist
```
