#!/bin/bash

if [[ $# -ne 1 ]] ; then
    echo "Need argument with pattern to search for"
    exit 1
fi

grep -rI --color=never $1 . | cut -f 1 -d : | uniq > file_list.txt

echo "File is file_list.txt"

