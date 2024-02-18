#!/bin/bash

echo "========================="
echo "Installing dotfiles..."
echo "========================="
echo ""

echo "[INFO] Installing brew bundle"
brew bundle --file=~/.dotfiles/Brewfile

echo "[INFO] Installed configs"
stow -d ~/.dotfiles -t ~/ ~/.dotfiles

echo ""
echo "========================="
echo "Installed dotfiles!"
echo "========================="
