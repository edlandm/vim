#!/bin/bash
# This script generates a list of the sources for every module in $VIM/bundle
# in the format of `username/module'
# It takes one argument which is the destination of the list.

BUNDLEPATH=$HOME/.vim/bundle
BUNDLES=$(ls $BUNDLEPATH | grep -v '.*~')
TMPFILE=$HOME/tmp_vim_source_list

echo "Getting sources, this may take a few seconds..."
# Generate list with $TMPFILE
for f in $BUNDLES;do
    SOURCE=$(cd $BUNDLEPATH/$f; git remote show origin | head -n2 | tail -n1)
    echo $SOURCE | sed 's/.*\.com\/\(.*\)/\1/' >> $TMPFILE
done
# Move $TMPFILE to given location
mv $TMPFILE $1

echo "Done!"
