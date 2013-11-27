#!/bin/bash

usage()
{
    echo "usage : csm.sh src_path [-gkp]"
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
find $SRC_PATH -name "*.h" -o -name "*.c" -o -name "Makefile" -o -name "makefile" -o -name "*.cpp" -o -name "*.CPP" -o -name "*.c++" -o -name "*.CC" -o -name "*.H" > cscope.file

KCONFIGS1="--regex=/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/\3/"
DEFCONFIGS="--langdef=dotconfig --language-force=dotconfig          \
--regex-dotconfig=/^#?[[:blank:]]*(CONFIG_[[:alnum:]_]+)/\1/"

all_target_sources()
{
    if [[ $1 =~ "g" ]]
    then
        # Add kernel source too
        find . ~/gcscope/ -name "cscope.file*" | xargs cat;
    else
        find . -name "cscope.file*" | xargs cat;
    fi
}

csp=" -bq -i - "
tgp=" -V -L - --file-scope=yes --fields=+iaS --extra=+q --languages=c,c++ \
    --links=yes --c-kinds=+p --c++-kinds=+p -I static,const "

if [[ $2 =~ "k" ]]
then
    csp=$csp" -k"
    tgp=$tgp" -I __initdata,__exitdata,__initconst,__devinitdata  \
    -I __devinitconst,__cpuinitdata,__initdata_memblock \
    -I __refdata,__attribute                \
    -I __acquires,__releases,__deprecated           \
    -I __read_mostly,__aligned,____cacheline_aligned        \
    -I ____cacheline_aligned_in_smp                         \
    -I ____cacheline_internodealigned_in_smp                \
    -I __used,__packed,__packed2__,__must_check,__must_hold \
    -I EXPORT_SYMBOL,EXPORT_SYMBOL_GPL                      \
    -I DEFINE_TRACE,EXPORT_TRACEPOINT_SYMBOL,EXPORT_TRACEPOINT_SYMBOL_GPL \
    --extra=+f --c-kinds=+px                               \
    --regex-asm=/^(ENTRY|_GLOBAL)\(([^)]*)\).*/\2/       \
    --regex-c=/^SYSCALL_DEFINE[[:digit:]]?\(([^,)]*).*/sys_\1/ \
    --regex-c++=/^TRACE_EVENT\(([^,)]*).*/trace_\1/       \
    --regex-c++=/^DEFINE_EVENT\([^,)]*,\s*([^,)]*).*/trace_\1/ \
    --regex-c++=/PAGEFLAG\(([^,)]*).*/Page\1/         \
    --regex-c++=/PAGEFLAG\(([^,)]*).*/SetPage\1/          \
    --regex-c++=/PAGEFLAG\(([^,)]*).*/ClearPage\1/        \
    --regex-c++=/TESTSETFLAG\(([^,)]*).*/TestSetPage\1/       \
    --regex-c++=/TESTPAGEFLAG\(([^,)]*).*/Page\1/         \
    --regex-c++=/SETPAGEFLAG\(([^,)]*).*/SetPage\1/       \
    --regex-c++=/__SETPAGEFLAG\(([^,)]*).*/__SetPage\1/       \
    --regex-c++=/TESTCLEARFLAG\(([^,)]*).*/TestClearPage\1/   \
    --regex-c++=/__TESTCLEARFLAG\(([^,)]*).*/TestClearPage\1/ \
    --regex-c++=/CLEARPAGEFLAG\(([^,)]*).*/ClearPage\1/       \
    --regex-c++=/__CLEARPAGEFLAG\(([^,)]*).*/__ClearPage\1/   \
    --regex-c++=/__PAGEFLAG\(([^,)]*).*/__SetPage\1/      \
    --regex-c++=/__PAGEFLAG\(([^,)]*).*/__ClearPage\1/        \
    --regex-c++=/PAGEFLAG_FALSE\(([^,)]*).*/Page\1/       \
    --regex-c++=/TESTSCFLAG\(([^,)]*).*/TestSetPage\1/        \
    --regex-c++=/TESTSCFLAG\(([^,)]*).*/TestClearPage\1/      \
    --regex-c++=/SETPAGEFLAG_NOOP\(([^,)]*).*/SetPage\1/      \
    --regex-c++=/CLEARPAGEFLAG_NOOP\(([^,)]*).*/ClearPage\1/  \
    --regex-c++=/__CLEARPAGEFLAG_NOOP\(([^,)]*).*/__ClearPage\1/  \
    --regex-c++=/TESTCLEARFLAG_FALSE\(([^,)]*).*/TestClearPage\1/ \
    --regex-c++=/__TESTCLEARFLAG_FALSE\(([^,)]*).*/__TestClearPage\1/ \
    --regex-c++=/_PE\(([^,)]*).*/PEVENT_ERRNO__\1/        \
    --regex-c=/PCI_OP_READ\((\w*).*[1-4]\)/pci_bus_read_config_\1/ \
    --regex-c=/PCI_OP_WRITE\((\w*).*[1-4]\)/pci_bus_write_config_\1/ \
    --regex-c=/DEFINE_(MUTEX|SEMAPHORE|SPINLOCK)\((\w*)/\2/v/ \
    --regex-c=/DEFINE_(RAW_SPINLOCK|RWLOCK|SEQLOCK)\((\w*)/\2/v/  \
    --regex-c=/DECLARE_(RWSEM|COMPLETION)\((\w*)/\2/v/        \
    --regex-c=/DECLARE_BITMAP\((\w*)/\1/v/            \
    --regex-c=/(^|\s)(|L|H)LIST_HEAD\((\w*)/\3/v/         \
    --regex-c=/(^|\s)RADIX_TREE\((\w*)/\2/v/          \
    --regex-c=/DEFINE_PER_CPU\(([^,]*,\s*)(\w*).*\)/\2/v/     \
    --regex-c=/DEFINE_PER_CPU_SHARED_ALIGNED\(([^,]*,\s*)(\w*).*\)/\2/v/ \
    --regex-c=/DECLARE_WAIT_QUEUE_HEAD\((\w*)/\1/v/       \
    --regex-c=/DECLARE_(TASKLET|WORK|DELAYED_WORK)\((\w*)/\2/v/   \
    --regex-c=/DEFINE_PCI_DEVICE_TABLE\((\w*)/\1/v/       \
    --regex-c=/(^\s)OFFSET\((\w*)/\2/v/               \
    --regex-c=/(^\s)DEFINE\((\w*)/\2/v/"

fi

if [[ $2 =~ "p" ]]
then
    tgp=$tgp" --langmap=c++:+.h"
else
    tgp=$tgp" --langmap=c:+.h"
fi

# make cscope from global and current director
all_target_sources $2 | cscope $csp

# make ctags from current director
all_target_sources $2 | ctags $tgp

# Remove structure forward declarations.
LANG=C sed -i -e '/^\([a-zA-Z_][a-zA-Z0-9_]*\)\t.*\t\/\^struct \1;.*\$\/;"\tx$/d' tags

