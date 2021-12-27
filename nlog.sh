#!/bin/bash -x

log_dir=${DEVDIR}/logs

log_dir_name=$(ls -ltr ${log_dir} | tail -1 | cut -d ' ' -f 9)

log_dir_path=${log_dir}/${log_dir_name}

grep -rIi -B1 -A1 '\<error\>' ${log_dir_path}
