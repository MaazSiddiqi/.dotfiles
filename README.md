# My dotfiles

<!--toc:start-->

- [Getting Started](#getting-started)
  - [Bootstrap and autoconfigure](#bootstrap-and-autoconfigure)
  - [Manual Install](#manual-install)
- [References and Honorable Mentions](#references-and-honorable-mentions)
<!--toc:end-->

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

Before proceeding, ensure you have **Homebrew** installed. You can easily check using:

```zsh
which -s brew

# If not installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Clone this repository in a place where you're comfortable keeping these files for a long time (typically, somewhere close to `~/`). This is due to the dependency from the symlinks for each of the files. I like to keep my dotfiles in `~/.dotfiles`

Assuming you want to keep this repository at `/path/to/repo`, run the following commands:

```zsh
# clone the repo
git clone https://github.com/MaazSiddiqi/.dotfiles /path/to/repo

# navigate to repo
cd /path/to/repo

# run install
/bin/bash install.sh
```

The install script, `install.sh`, takes care of implementing the configurations. All the configuration files are symlinked to their respective positions, and downloads the formulas and casks listed in the `Brewfile`.

## References and Honorable Mentions

A lot of my configurations were inspired by others! Here are a few:

- [Wezterm: Whole configuration from @basokant](https://github.com/basokant/dotfiles/tree/main/.config/wezterm)
- [Neovim: Some awesome keymaps by @ThePrimeagen](https://github.com/ThePrimeagen/init.lua/blob/249f3b14cc517202c80c6babd0f9ec548351ec71/lua/theprimeagen/remap.lua)
