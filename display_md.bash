#!/bin/bash
#Generate html from md file

if [ "$#" != "1" ]; then
    echo "You must provide markdown file name."
    exit 1
fi

#See which signal is being sentexit 2
for s in {1..64} ;do trap "echo trap $s" $s ;done

file_route=$(readlink -f $1)
file_dir=$(dirname ${file_route})
file_name=$(basename ${file_route})

#Cd to dir, so that it finds local images
cd ${file_dir}

#Grep returns 0 if finds a match in a file, and 1 if it doesn't find a match
grep @startuml ${file_name} > /dev/null 2>&1

#If it does contain a plantuml diagram
if [[ $? -eq 0 ]] ; then
  java -jar /app/vbuild/tools/plantuml/1.2019.11/bin/plantuml.jar -tsvg ${file_name} > /dev/null 2>&1

  if [[ $? -eq 1 ]] ; then
    echo "You cannot generate plantuml here, you need somewhere with correctly configured graphic display"
    exit 2
  fi
fi

pandoc -o output.html ${file_name}
firefox output.html &



