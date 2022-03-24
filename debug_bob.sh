#!/usr/bin/env bash
cpp_builder_path=${EPG_DIR}/up/ruleset/images.yaml
cpp_builder=$(grep cpp-builder: ${cpp_builder_path} | awk '{ print $3  }')
docker run -e COLUMNS=`tput cols` -e LINES=`tput lines` -e TERM=${TERM} --rm -it --init --user `id -u`:`id -g` --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --volume ${PWD}:${PWD} --workdir ${PWD} ${cpp_builder} gdb -q -iex "set auto-load safe-path /" "$@"
