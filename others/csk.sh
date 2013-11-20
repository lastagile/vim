#!/bin/sh
usage()
{
    echo "usage : csk.sh src_path <-r>"
    echo "I will create file list in ~/kcscope/cscope.filek"
    echo "src_path can be file or dir, and -r is for recursive in src_path"
}
if [ $# -lt 1 ];
then
    usage
    exit
fi


mkdir -p  ~/kcscope
CSCOPE_PATH=~/kcscope/cscope.filek


if [ -d $1 ];
then
# add the dir to cscope.filek
    cd $1
    # Using SRC_PATH let find cmd get the absolute path, and maxdepth reduce recursive find
    SRC_PATH=$PWD
    if [ $# -eq 1 ];then
        find $SRC_PATH -maxdepth 1 -name "*.h" -o -name "*.c" -o -name "Makefile" -o -name "makefile" >> $CSCOPE_PATH
    else
        find $SRC_PATH -name "*.h" -o -name "*.c" -o -name "Makefile" -o -name "makefile" >> $CSCOPE_PATH
    fi
elif [ -f $1 ];
then
    # Add file
    echo "${PWD}/$1" >> $CSCOPE_PATH
fi

# remove duplication
awk '!x[$0]++' $CSCOPE_PATH > /tmp/cscope.tmp && rm $CSCOPE_PATH && mv /tmp/cscope.tmp $CSCOPE_PATH
