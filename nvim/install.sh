#!/usr/bin/env bash
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/lua 

# link wholesale
for f in `find . -regex ".*\.vim$\|.*\.lua$" | sed 's|^./||'`; do
    rm -rf ~/.config/nvim/$f
    ln -s ~/dotfiles/nvim/$f ~/.config/nvim/$f
done
