#!/bin/bash

echo "========================="
echo "Installing dotfiles..."
echo "========================="
echo ""

echo "[INFO] Installed configs"
stow -d ~/.dotfiles -t ~/ ~/.dotfiles

echo "[INFO] Installing brew bundle"
brew bundle --file=~/.dotfiles/Brewfile

echo ""
echo "========================="
echo "Installing dotfiles..."
echo "========================="
