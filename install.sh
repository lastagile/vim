#!/bin/bash

echo "Install vim configurations..."

echo "cd to .vim directory"
cd ~/.vim

echo "create .vimrc"

sysOS=`uname -s`

mkdir ~/back
function backup {
  if [ -f ~/$i ]; then
    mv ~/$i ~/back/${i}_`date +%Y%m%d_%s`
  fi
}

backup .vimrc
backup .gvimrc
backup .ideagvimrc

if [ $sysOS == "Darwin" ];then
  echo "I'm MacOS"
  ln -s ~/.vim/others/vimrc.local_mac ~/.vimrc
  ln -s ~/.vim/others/vimrc.local_mac ~/.gvimrc
  ln -s ~/.vim/others/vimrc.local_mac ~/.ideavimrc
else
  echo "Other OS: $sysOS"
  ln -s ~/.vim/others/vimrc.local ~/.vimrc
  ln -s ~/.vim/others/vimrc.local ~/.gvimrc
fi
 

backup .screenrc
ln -s ~/.vim/others/screenrc ~/.screenrc

backup .bash_alias
if [ $sysOS == "Darwin" ];then
  echo "I'm MacOS"
  ln -s ~/.vim/others/bash_aliases_mac ~/.bash_aliases
else
  echo "Other OS: $sysOS"
  ln -s ~/.vim/others/bash_aliases ~/.bash_aliases
fi
 

if [ "`cat ~/.bashrc|grep -c bash_aliases`" != 0 ] ; then
echo 'if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi' >> ~/.bashrc
fi


if [ $sysOS == "Linux" ];then
  mkdir ~/bin
  rm ~/bin/csg.sh
  ln -s ~/.vim/others/csg.sh ~/bin/csg.sh

  rm ~/bin/csm.sh
  ln -s ~/.vim/others/csm.sh ~/bin/csm.sh
fi

git remote set-url origin git@github.com:lastagile/vim.git

echo "update submodules"
git submodule init
git submodule update

git submodule foreach git pull origin master

