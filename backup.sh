#!/bin/bash -x

route=/home/esecjos/backup
filename=${route}/backup_$(date +%j).tar

if [[ -f ${filename} ]]; then
	echo "File exists"
	exit 0
fi

tar -C / -cvf ${filename} home/esecjos/.cshrc.user > /dev/null
tar -C / -rvf ${filename} home/esecjos/.bashrc.user > /dev/null
tar -C / -rvf ${filename} home/esecjos/bin/backup.sh > /dev/null
tar -C / -rvf ${filename} home/esecjos/bin/nlog.sh > /dev/null
tar -C / -rvf ${filename} home/esecjos/.gitconfig > /dev/null
tar -C / -rvf ${filename} home/esecjos/.vim > /dev/null
tar -C / -rvf ${filename} home/esecjos/.vimrc > /dev/null


find ${route} -mtime +30 -delete

