#!/bin/sh

# This will copy permissions from one file/directory to another recursively
# If you are going to use 'cp -r /my/dir /new/dir' just use -p to retain permissions

# usage
# ./chmod-copy-perms.sh /copy/perm/from /copy/perm/to

chmod -v --reference $1 $2
if [ -d $1 ]
then
    if [ "x`ls $1`" != "x" ]
    then
        for f in `ls $1`
        do
            $0 $1/$f $2/$f
        done
    fi
fi
