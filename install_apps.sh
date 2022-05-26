#!/bin/bash


# create install directory

INSTALL_DIR="$HOME/installs"


echo 'Creating install directories'
mkdir $INSTALL_DIR
cd $INSTALL_DIR

echo $INSTALL_DIR

echo 'Installing Dependencies'

#sudo apt-get -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen git i3 zsh
#
#sudo dnf -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext curl
#
#git clone https://github.com/neovim/neovim
#cd neovim
#
#make CMAKE_BUILD_TYPE=Release
#sudo make install

cd $INSTALL_DIR

# curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


cd $INSTALL_DIR
rm $INSTALL_DIR/go1.*.tar.gz
wget https://go.dev/dl/go1.18.2.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.18.2.linux-amd64.tar.gz

export PATH=$PATH:/usr/local/go/bin

echo "Test go install\n"
go version

cd $INSTALL_DIR
# echo "Get fonts\n"
# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
# echo ""
# echo "Install fonts"
# unzip JetBrainsMono.zip
# cd $INSTALL_DIR/JetBrainsMono
# sudo mkdir /usr/share/fonts/jetbrainsmono
# sudo mv *.ttf /usr/share/fonts/
# fc-cache -f -v

