#!/bin/bash -x

log_dir=${DEVDIR}/epg

log_dir_name=$(ls -ltr ${log_dir} *.log | tail -1 | rev | cut -d ' ' -f 1 | rev)

log_dir_path=${log_dir}/${log_dir_name}

#Remove color codes from log. 
#This actually removes all escape sequences, not only color codes
sed -i 's/\x1b\[[0-9;]*[a-zA-Z]//g'  ${log_dir_path}

grep --color=always -rIi -B1 -A1 '\<error\>' ${log_dir_path} | less -R
