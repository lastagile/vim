#!/bin/bash

echo "Install vim configurations..."

echo "cd to .vim directory"
cd ~/.vim

echo "create .vimrc"

mkdir ~/back

if [ -f ~/.vimrc ]; then
mv ~/.vimrc ~/back/.vimrc_`date +%Y%m%d_%s`
fi
ln -s ~/.vim/others/vimrc.local ~/.vimrc

if [ -f ~/.grvimrc ]; then
mv ~/.gvimrc ~/.gvimrc_`date +%Y%m%d_%s`
fi
ln -s ~/.vim/others/vimrc.local ~/.gvimrc

if [ -f ~/.screenrc ]; then
    mv ~/.screenrc ~/.screenrc_`date +%Y%m%d_%s`
fi
ln -s ~/.vim/others/screenrc ~/.screenrc

if [ -f ~/.bash_aliases ]; then
    mv ~/.bash_aliases ~/.bash_aliases_`date +%Y%m%d_%s`
fi
ln -s ~/.vim/others/bash_aliases ~/.bash_aliases

if [ "`cat ~/.bashrc|grep -c bash_aliases`" != 0 ] ; 
echo 'if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi' >> ~/.bashrc
fi


mkdir ~/bin
rm ~/bin/csg.sh
ln -s ~/.vim/others/csg.sh ~/bin/csg.sh

rm ~/bin/csm.sh
ln -s ~/.vim/others/csm.sh ~/bin/csm.sh

echo "update submodules"
git submodule init
git submodule update

git submodule foreach git pull origin master
