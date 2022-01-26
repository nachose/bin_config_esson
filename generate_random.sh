cat /dev/urandom | tr -dc a-fA-F0-9 | fold -w 8 | head -n 1
