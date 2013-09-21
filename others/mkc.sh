#!/bin/sh
usage()
{
  echo "usage : makecscope src_path"
	echo "I will create cscope db in $PWD/cscope"
}
if [ $# -ne 1 ]
  then
  usage
  exit
fi
cd $1
ctags -R
SRC_PATH=$PWD
CSCOPE_PATH=$PWD/cscope
mkdir -p $CSCOPE_PATH
cd $CSCOPE_PATH
find $SRC_PATH -name "*.h" -o -name "*.c" -o -name "Makefile" -o -name "makefile" -o -name "*.cpp" -o -name "*.CPP" -o -name "*.c++" -o -name "*.CC" -o -name "*.H" > cscope.files
cscope -bkq -i ./cscope.files
