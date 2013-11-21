#!/bin/bash

echo "Install vim configurations..."

echo "cd to .vim directory"
cd ~/.vim

echo "create .vimrc"
if [ -f ~/.vimrc ]; then
rm ~/.vimrc
fi

ln -s ~/.vim/others/vimrc.local ~/.vimrc
if [ -f ~/.grvimrc ]; then
rm ~/.gvimrc
fi

ln -s ~/.vim/others/vimrc.local ~/.gvimrc

if [ -f ~/.screenrc ]; then
    rm ~/.screenrc
fi
ln -s ~/.vim/others/screenrc ~/.screenrc

if [ -f ~/.bash_aliases ]; then
    rm ~/.bash_aliases
fi
ln -s ~/.vim/others/bash_aliases ~/.bash_aliases

echo ". ~/.bash_aliases" >> ~/.bashrc

mkdir ~/bin
rm ~/bin/csg.sh
ln -s ~/.vim/others/csg.sh ~/bin/csg.sh

rm ~/bin/csk.sh
ln -s ~/.vim/others/csk.sh ~/bin/csk.sh

echo "update submodules"
git submodule init
git submodule update

git submodule foreach git pull origin master
