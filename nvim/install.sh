#!/usr/bin/env bash

rm -rf ~/.config/nvim/

mkdir -p ~/.config/nvim/plugin/lsp
mkdir -p ~/.config/nvim/after/plugin/lsp
mkdir -p ~/.config/nvim/lua 
mkdir -p ~/.config/alacritty/

# link wholesale
for f in `find . -regex ".*\.vim$\|.*\.lua$" | sed 's|^./||'`; do
    rm -rf ~/.config/nvim/$f
    ln -sf ~/dotfiles/nvim/$f ~/.config/nvim/$f
done

