#!/bin/bash

echo "Install vim configurations..."

echo "cd to .vim directory"
cd ~/.vim

echo "create .vimrc"
rm ~/.vimrc
rm ~/.gvimrc
ln -s ~/.vim/others/vimrc.local ~/.vimrc
ln -s ~/.vim/others/vimrc.local ~/.gvimrc

rm ~/.screenrc
ln -s ~/.vim/others/screenrc ~/.screenrc

mkdir ~/bin
rm ~/bin/mkc.sh
ln -s ~/.vim/others/mkc.sh ~/bin/mkc.sh

echo "update submodules"
git submodule init
git submodule update

git submodule foreach git pull origin master
