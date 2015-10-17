my vim configuration
===================================

Cheat sheat
----------------------------------
[Cheat sheat](http://cenalulu.github.io/linux/all-vim-cheatsheat/)<br/>

Git Hub usage
----------------------------------
    get from github:
    git clone https://github.com/lastagile/vim.git
    git pull
    echo "set up ssh key first. then update submodules"
    # git submodule init
    # git submodule update
    # git submodule foreach git pull origin master
    # git submodule update --init --recursive
    
    update to github:
    git add <files>
    git rm <files>
    git remote add origin github.com/lastagile/vim.git
    git commit -a -m "xxxxxx"
    git push


[Git SSH KEY setep 1 and setep 2](http://blog.csdn.net/benw1988/article/details/8492968)<br/>
[Git for Vim Refrence](https://github.com/andyque/dotvim)<br/>
[Git visual guide](http://marklodato.github.io/visual-git-guide/index-en.html)<br/>
[Git submodule](http://chrisjean.com/2009/04/20/git-submodules-adding-using-removing-and-updating)<br/>

Add git sub module
-------------------
    git submodule add git@github.com:oblitum/bufkill bundle/bufkill
Remove sub module
--------------------
    edite :.gitmodules and .git/config
    git rm --cached bundle/bufkill

Vim setting:
----------------------------------

[To Evernote](http://www.evernote.com/shard/s73/sh/b4ee9bb5-34d5-41f2-aad1-cce4a463a01a/649b0610a8598938eac60b1607b2d456)<br />
[To ZiLong](http://zilongshanren.com/blog/2013/01/15/vim-the-killer/)<br/>
[k-vim](https://github.com/wklken/k-vim)<br/>

自定义快捷键：
-----------------------------------
    F1  关掉，防止跳出帮助
    F2  set nu/nonu
    F5  set paste/nopaste
    F8  tagbar
    空格 /折叠
    Y   =y$   复制到行尾
    H =0
    L =$
    w!!  以sudo的权限保存
    t    新起一行，下面，不进入插入模式
    T    新起一行，上面
    hjkl  上下左右
    ctrl + jkhl 进行上下左右窗口跳转,不需要ctrl+w+jkhl
    gc<action>  注释代码
    gcc 注释本行代码
    5j/5k  在相对行号模式下，往上移动5行 往下移动5行
    ,w :w!
    ,f :find
    ,q :q
    ,r :reg
    ,n nerdtree
    ,/ 去除匹配高亮
    空格 折叠代码
    <c-n> normal模式设置是否相对行数，插入模式complete
    左右箭头 bp bn
    

    

Other settings
===================================
Ubuntu
---------------------------------
[ssh](http://blog.csdn.net/netwalk/article/details/12952051)<br/>
[更新源](http://wiki.ubuntu.org.cn/%E6%BA%90%E5%88%97%E8%A1%A8)<br/>
sudo apt-get install git
### VIM 安装相关软件包
    sudo apt-get install build-essential
    sudo apt-get install ncurses-dev
    sudo apt-get install xorg-dev
    sudo apt-get install libgtk2.0-dev
### 安装vim
    sudo apt-get install vim vim-scripts vim-gnome vim-gtk
    sudo apt-get install exuberant-ctags cscope
    
Colore Setting
---------------------------------------
[Colore setting](http://ethanschoonover.com/solarized)<br/>
[In ubuntu](http://www.lupaworld.com/article-210612-1.html)<br/>
[OS X terminal](https://github.com/tomislav/osx-terminal.app-colors-solarized/blob/master/Solarized%20Dark.terminal)

    git clone https://github.com/coolwanglu/gnome-terminal-colors-solarized.git
    cd gnome-terminal-colors-solarized/
    ./set_dark.sh
    ./set_light.sh
    ./install.sh
 
Putty setting:
----------------------------------------
vim小键盘不能输入<br>
Terminal->Features里，找到Disable application keypad mode<br>
[Solarized color setting for putty](https://github.com/brantb?tab=repositories)<br/>

