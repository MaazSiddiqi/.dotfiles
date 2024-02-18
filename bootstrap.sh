#!/bin/bash

echo "========================="
echo "Bootstrapping dotfiles..."
echo "========================="
echo ""

# echo "Checking Homebrew..."
# which -s brew
# if [[ $? != 0 ]] ; then
#     echo "Homebrew not found, installing:"
#     # Install Homebrew
#     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# else
#     echo "Homebrew found, updating:"
#     brew update
# fi
#

if [[ -e ~/.dotfile ]]; then
  echo "[INFO] Backing up old dotfiles"
  mv ~/.dotfile ~/.dotfile.bak 
fi

git clone https://github.com/MaazSiddiqi/.dotfiles.git ~/.dotfile
