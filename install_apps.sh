#!/bin/bash


# create install directory

INSTALL_DIR="$HOME/installs"


echo 'Creating install directories'
mkdir $INSTALL_DIR
cd $INSTALL_DIR

echo $INSTALL_DIR

echo 'Installing Dependencies'

sudo apt-get -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen git i3 zsh

#git clone https://github.com/neovim/neovim
#cd neovim
#
#make CMAKE_BUILD_TYPE=Release
#sudo make install

cd $INSTALL_DIr

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
