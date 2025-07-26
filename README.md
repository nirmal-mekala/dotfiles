# Nirmal Mekala’s Dotfiles

> A set of dotfiles for use with `zsh`.

## Usage

The script in this directory assumes the directory exists at `~/.dotfiles`. Clone the repo to that location.

```sh
git clone https://github.com/nirmal-mekala/dotfiles ~/.dotfiles
```

Review the setup script. Then `cd` into the directory and run the setup command.

```sh
cd ~/.dotfiles
./setup_dotfiles
```

This script performs three main functions:

- creating simple symlinks between dotfiles in this directory and `~`
- creating symlinks between subdirectories in this directory and specific places within dotfiles (e.g. `nvim` goes to `~/.config/nvim`)
- copying sample files that need machine-specific configuration

It will backup existing files and skip if a symlink already exists.

## What’s Included

- Neovim setup
- powerlevel10k zsh setup
- karabiner elements (macOS keybindings) setup
- `z` for fast directory jumping
- a minimalist `tmux` configuration
- colorschemes for iTerm on macOS
- config and colorschemes for `xterm` on other systems
- a simple `i3` configuration

I’ve used these dots as a base to configure macOS, Linux, and OpenBSD systems. The script will (harmlessly) set up _all_ the config files, not just those intended for the particular OS.

## See Also

- These dotfiles and script are used as part of [`wizardry`](https://github.com/nirmal-mekala/wizardry), a script I use to configure and manage my macOS systems
- `docs/sources.md` for more info on what all is included here

## Acknowledgements

- Takuya Matsuyama’s [dotfiles](https://github.com/craftzdog/dotfiles-public) and setup are the number one inspiration for this project
- Zach Holman’s [dotfiles](https://github.com/holman/dotfiles)
