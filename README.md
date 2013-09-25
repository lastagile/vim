my vim configuration
===================================



Git Hub usage
----------------------------------
    update to github:
    git add <files>
    git rm <files>
    git remote add origin github.com/lastagile/vim.git
    git commit -a -m "xxxxxx"
    git push

    get from github:
    git clone https://github.com/lastagile/vim.git
    git pull
    echo "update submodules"
    git submodule init
    git submodule update
    git submodule foreach git pull origin master
[Git for Vim Refrence](https://github.com/andyque/dotvim)<br/>
[Git visual guide](http://marklodato.github.io/visual-git-guide/index-en.html)<br/>
[Git SSH KEY](http://blog.csdn.net/benw1988/article/details/8492968)

Vim setting:
----------------------------------
[To Evernote](http://www.evernote.com/shard/s73/sh/b4ee9bb5-34d5-41f2-aad1-cce4a463a01a/649b0610a8598938eac60b1607b2d456)<br />
[To ZiLong](http://zilongshanren.com/blog/2013/01/15/vim-the-killer/)

Other settings
===================================
Ubuntu vim
---------------------------------
### VIM 安装相关软件包
    sudo apt-get install build-essential
    sudo apt-get install ncurses-dev
    sudo apt-get install xorg-dev
    sudo apt-get install libgtk2.0-dev
### 安装vim
    sudo apt-get install vim vim-scripts vim-gnome vim-gtk
    sudo apt-get install exuberant-ctags cscope

Clang complete install
------------------------------------

    sudo apt-get install clang
    git clone https://github.com/Rip-Rip/clang_complete
    cd clang_complete/
    make install
    
[Clang complete]https://github.com/Rip-Rip/clang_complete< br/>

Colore Setting
---------------------------------------
[Colore setting](http://ethanschoonover.com/solarized)<br/>
[In ubuntu](http://www.lupaworld.com/article-210612-1.html)

    git clone https://github.com/coolwanglu/gnome-terminal-colors-solarized.git
    cd gnome-terminal-colors-solarized/
    ./set_dark.sh
    ./set_light.sh
    ./install.sh
 
Putty setting:
----------------------------------------
[Solarized color setting for putty](https://github.com/brantb?tab=repositories)

