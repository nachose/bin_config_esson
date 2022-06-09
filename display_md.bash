#!/bin/bash
#Generate html from md file

if [ "$#" != "1" ]; then
    echo "You must provide markdown file name."
    exit 1
fi

file_route=$(readlink -f $1)
file_dir=$(dirname ${file_route})
file_name=$(basename ${file_route})

#Cd to dir, so that it finds local images
cd ${file_dir}
pandoc -o output.html ${file_name}
firefox output.html &



