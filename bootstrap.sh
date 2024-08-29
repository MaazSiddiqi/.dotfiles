#!/bin/bash

echo "========================="
echo "Bootstrapping dotfiles..."
echo "========================="
echo ""

echo "[INFO] Checking Homebrew..."
which -s brew
if [[ $? != 0 ]]; then
  echo "[INFO] Homebrew not found, installing now."
  # Install Homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "[INFO] Homebrew found, updating now"
  brew update
fi

if [[ -e ~/.dotfiles ]]; then
  echo "[INFO] Backing up old dotfiles to ~/.dotfiles.bak"
  mv ~/.dotfiles ~/.dotfiles.bak
fi

echo "[INFO] Downloading dotfiles to ~/.dotfiles"
git clone https://github.com/MaazSiddiqi/.dotfiles.git ~/.dotfiles

echo ""
echo "======================"
echo "Finished Bootstrapping"
echo "======================"

bash ~/.dotfiles/install.sh
