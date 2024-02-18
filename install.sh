#!/bin/bash

echo "========================="
echo "Installing dotfiles..."
echo "========================="
echo ""

echo "[INFO] Installing brew bundle"
brew bundle

echo "[INFO] Installed configs"
stow -t ~/ .

echo ""
echo "========================="
echo "Installed dotfiles!"
echo "========================="
