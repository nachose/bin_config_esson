#!/bin/bash
#Find and display md file

if [ "$#" != "1" ]; then
    echo "You must provide number to grep."
    exit 1
fi

files_found=$(find -L $HOME/repo -ignore_readdir_race -name '*.md' 2> /dev/null | grep $1)

for file in ${files_found}
do

display_md.bash ${file}

done


