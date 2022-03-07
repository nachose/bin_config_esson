#!/bin/bash

file_name=backup_modif_files_$1_$(date +%j_%s).tar

git status | grep -e 'new file\|modified file' | cut -f 2 -d : | xargs tar -rvf ${file_name}

mv $[file_name] ~/code_backup

cd ~/code_backup/


#Delete files older than three days.
find ${route} -mtime +3 -delete
