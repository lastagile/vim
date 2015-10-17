#!/bin/bash

echo "Install unix configurations..."

BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

lnif() {
    if [ -e "$1" ]; then
        ln -sf "$1" "$2"
    fi
}

sysOS=`uname -s`
if [ $sysOS == "Darwin" ];then
  echo "I'm MacOS"
  VIMRC_FILE=vimrc.local_mac
  BASH_ALIAS_FILE=bash_aliases_mac
else
  echo "Other OS: $sysOS"
  VIMRC_FILE=vimrc.local
  BASH_ALIAS_FILE=bash_aliases
fi

mkdir $HOME/back
function backup {
  if [ -f $HOME/$1 ]; then
    echo "move $1"
    mv $HOME/$1 $HOME/back/${1}_`date +%Y%m%d_%s`
  fi
}

echo "Step1: backing up current vim config"

for i in .vim .vimrc .gvimrc .vimrc.bundles .ideavimrc .screenrc .bash_alias; do [ -e $i ] && [ ! -L $i ] && backup $i ; done
for i in .vim .vimrc .gvimrc .vimrc.bundles .ideavimrc .screenrc .bash_alias; do [ -L $i ] && unlink $i ; done

echo "Step2: setting up symlinks"
 
lnif $CURRENT_DIR/others/screenrc $HOME/.screenrc
lnif $CURRENT_DIR/others/vimrc.bundles $HOME/.vimrc.bundles
lnif $CURRENT_DIR/others/$VIMRC_FILE $HOME/.vimrc
lnif $CURRENT_DIR/others/$VIMRC_FILE $HOME/.gvimrc
lnif $CURRENT_DIR/others/$VIMRC_FILE $HOME/.ideavimrc
lnif $CURRENT_DIR/others/$BASH_ALIAS_FILE $HOME/.bash_aliases
lnif $CURRENT_DIR $HOME/.vim

if [ "`cat $HOME/.bashrc|grep -c bash_aliases`" == 0 ] ; then
echo 'if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi' >> $HOME/.bashrc
fi

if [ $sysOS == "Linux" ];then
  mkdir $HOME/bin
  rm $HOME/bin/csg.sh
  ln -s $CURRENT_DIR/others/csg.sh $HOME/bin/csg.sh
  rm $HOME/bin/csm.sh
  ln -s $CURRENT_DIR/others/csm.sh $HOME/bin/csm.sh
fi

echo "Step3: install vundle"
if [ ! -e $CURRENT_DIR/bundle/vundle ]; then
    echo "Installing Vundle"
    git clone https://github.com/gmarik/vundle.git $CURRENT_DIR/bundle/vundle
else
    echo "Upgrade Vundle"
    cd "$HOME/.vim/bundle/vundle" && git pull origin master
fi

echo "Step4: update/install plugins using Vundle"
system_shell=$SHELL
export SHELL="/bin/sh"
vim -u $HOME/.vimrc.bundles +BundleInstall! +BundleClean +qall
export SHELL=$system_shell

