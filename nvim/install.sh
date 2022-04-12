#!/usr/bin/env bash

rm -rf $HOME/.config/nvim/lua/turts

#remake the dirs
mkdir -p $HOME/.config/nvim/lua/turts

for f in `find . -regex ".*\.vim$\|.*\.lua$" | sed 's|^./||'`; do
	echo "Removing: $f"
	rm -rf $HOME/.config/$f
	echo "Linking $f"
	ln -s $HOME/dotfiles/nvim/$f $HOME/.config/nvim/$f
done
