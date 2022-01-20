#!/bin/bash 

route=/home/esecjos/backup
filename=${route}/backup_$(date +%j).tar

if [[ -f ${filename} ]]; then
	exit 0
fi

tar -C / -cvf ${filename} home/esecjos/.cshrc.user > /dev/null
tar -C / -rvf ${filename} home/esecjos/.bashrc.user > /dev/null
tar -C / -rvf ${filename} --exclude=.git home/esecjos/bin > /dev/null
tar -C / -rvf ${filename} home/esecjos/.gitconfig > /dev/null
tar -C / -rvf ${filename} home/esecjos/.gdbinit > /dev/null
tar -C / -rvf ${filename} --exclude=plugged home/esecjos/.vim > /dev/null
tar -C / -rvf ${filename} home/esecjos/.vimrc > /dev/null
#tar -C / -rvf ${filename} $(find -P /home/esecjos -type l) > /dev/null


find ${route} -mtime +15 -delete

