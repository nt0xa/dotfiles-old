# Dotfiles
Just my configuration files.

# Install
```
brew install stow
git clone --recursive https://github.com/russtone/dotfiles.git
cd dotfiles

stow -t ~ zsh vim tmux misc
```

# Uninstall
```
stow -D -t ~ zsh vim tmux misc
```

