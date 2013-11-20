#!/bin/sh
usage()
{
    echo "usage : csm.sh src_path [-k]"
    echo "I will create cscope db in $PWD/cscope"
}

if [ $# -lt 1 ]
then
    usage
    exit
fi

cd $1
SRC_PATH=$PWD
CSCOPE_PATH=$PWD/cscope
mkdir -p $CSCOPE_PATH
cd $CSCOPE_PATH
# add source files
find $SRC_PATH -name "*.h" -o -name "*.c" -o -name "Makefile" -o -name "makefile" -o -name "*.cpp" -o -name "*.CPP" -o -name "*.c++" -o -name "*.CC" -o -name "*.H" > cscope.file1


if [ $# -eq 2 ]
then
    # Add kernel source too
    find . ~/kcscope/ -name "cscope.file*" | xargs cat | cscope -bkq -i -
    find . ~/kcscope/ -name "cscope.file*" | xargs cat | ctags -L -
else
    find . -name "cscope.file*" | xargs cat | cscope -bkq -i -
    find . -name "cscope.file*" | xargs cat | ctags -L -
fi

