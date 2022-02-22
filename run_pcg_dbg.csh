setenv repo_home_dir /repo/esecjos/workspace/code/epg
setenv current_dir $(pwd)
if( $repo_home_dir != $current_dir ) then
    echo "Must run from repo home dir : epg"
    exit(1)
endif
docker run --rm -it --init --user `id -u`:`id -g` --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --volume ${PWD}:${PWD} --workdir ${PWD} ${builder_image_and_tag} gdb;

