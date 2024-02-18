echo "Bootstrapping dotfiles..."

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/nvim/ ~/.config/nvim
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/wezterm/ ~/.config/wezterm

# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
