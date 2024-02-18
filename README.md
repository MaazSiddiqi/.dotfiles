# My dotfiles

This repository contains a collection of my configurations for my most frequently used tools. I've heavily focused my configurations around a vim-friendly workflow running on MacOS.

## Getting Started

There are 2 ways to get started with these configurations: Through the bootstrap or manually after cloning.

### Bootstrap and autoconfigure

If you would like to setup this configuration immediately, you can run the `bootstrap.sh` script by pasting this in your terminal:

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/MaazSiddiqi/.dotfiles/HEAD/bootstrap.sh)"
```

Features of this bootstrap:

- Ensure `Homebrew` is installed and updated
- Backup conflicting `~/.dotfiles`
- Download these configurations to `~/.dotfiles`
- Run the install script

### Manual Install

If you would like to setup these configurations manually, start by cloning this repository to `~/.dotfiles`:

```zsh
git clone https://github.com/MaazSiddiqi/.dotfiles ~/.dotfiles
```

Navigate to `~/.dotfiles` and run `install.sh`.

```zsh
cd ~/.dotfiles
/bin/bash install.sh
```

The install script, `install.sh`, takes care of implementing the configurations. All the configuration files are symlinked to their respective positions, and downloads the formulas and casks listed in the `Brewfile`.

Don't want to download to `~/.dotfiles`? Read here.

## FAQ

**I don't want to download the repository to `~/.dotfiles`, what should I do?**

No worries! Unfortunately, you won't be able to use any of the scripts, but it is still possible to manually set up these configurations.

Before proceeding, ensure you have **Homebrew** installed. You can easily check using:

```zsh
which -s brew

# If not installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Clone this repository in a place where you're comfortable keeping these files for a long time (typically, somewhere close to `~/`). This is due to the dependency from the symlinks for each of the files.

Assuming you want to keep this repository at `/path/to/repo`, run the following commands:

```zsh
# clone the repo
git clone https://github.com/MaazSiddiqi/.dotfiles /path/to/repo

# set up symlinks
stow -d /path/to/repo -t ~/ /path/to/repo

# install brew bundle
brew bundle --file=/path/to/repo/Brewfile
```
