#!/usr/bin/env bash

# Empty/clean the configs
rm -rf/ ~/.config/nvim

# Remake the directories
mkdir -p ~/.config/nvim/plugin/lsp
mkdir -p ~/.config/nvim/lua/turts
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/alacritty/

# link wholesale
for f in `find . -regex ".*\.vim$\|.*\.lua$" | sed 's|^./||'`; do
    echo "Removing: $f"
    rm -rf ~/.config/nvim/$f
    echo "Linking: $f"
    ln -s ~/dotfiles/nvim/$f ~/.config/nvim/$f
done

