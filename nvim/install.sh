#!/usr/bin/env bash
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin/lsp
mkdir -p ~/.config/nvim/lua 
mkdir -p ~/.config/alacritty/

# link wholesale
for f in `find . -regex ".*\.vim$\|.*\.lua$" | sed 's|^./||'`; do
    rm -rf ~/.config/nvim/$f
    ln -sf ~/dotfiles/nvim/$f ~/.config/nvim/$f
done

