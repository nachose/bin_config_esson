#!/bin/bash

dir=$(echo ${1} | sed "s/\//_/g")
file_name=backup_modif_files_${dir}_$(date +%j_%s).tar

cd ${1}

#Add to tar modified files, but not modified directories
git status | grep -e 'new file\|modified' | grep -v 'modified content' | grep -v 'new commits' | cut -f 2 -d : | xargs tar -rvf ${file_name}

backup_code_dir=~/code_backup

#file_sum=$(md5sum ${file_name})
#file_sum=$(echo ${file_sum} | cut -f 1 -d ' ')
#Store output of md5sum command in array variable
#old_IFS=${IFS}
#IFS=$'\n'
##IFS=$(echo -en "\n\b")
#sum_all_files=( $($IFS=$'\n'md5sum ${backup_code_dir}/*) )
#IFS=${old_IFS}

##Delete all files with same checksum
#for sum_file in ${sum_all_files}; do
#    echo "For debug, echo sum file : ${sum_file}"
##    tar_file_name=$(echo ${sum_file} | cut -f 2 -d ' ')
#    tar_file_sum=$(echo ${sum_file} | cut -f 1 -d ' ')
#    if [ "${file_sum}" = "${tar_file_sum}" ]; then
#        rm -f ${backup_code_dir}/${tar_file_name}
#    fi
##done

mv ${file_name} ${backup_code_dir}

#Delete files older than three days.
find ~/code_backup/ -mtime +3 -delete
