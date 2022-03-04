docker run -it --init --rm --user `id -u`:`id -g` --tty --network none --env USER=esecjos --env CONFIG_STAGING_HEURISTICS_DPI=/workspace/git/esecjos/epg/staging/heuristics_dpi --env CC=/usr/local/bin/gcc-9.2.0 --env CXX=/usr/local/bin/g++-9.2.0 --env CCACHE=/usr/bin/ccache --env CCACHE_DIR=/workspace/git/esecjos/ccache --env PREFIX=/usr/local --volume /workspace/git/esecjos/ccache:/workspace/git/esecjos/ccache --env ASAN_OPTIONS="detect_leaks=0:symbolize=1:symbolize_inline_frames=1:allow_addr2line=1:use_sigaltstack=1:print_suppressions=1:exitcode=99:check_printf=1:dump_instruction_bytes=1:detect_invalid_pointer_pairs=0:detect_odr_violation=1:fast_unwind_on_fatal=1" --env WS_ROOT="`git rev-parse --show-toplevel`" --volume /workspace/git/esecjos/epg:/workspace/git/esecjos/epg --workdir /workspace/git/esecjos/epg/ selndocker.mo.sw.ericsson.se/proj-pc-epg/cppbuilder:1.48.0-0


#Debug en pcg, csh
setenv builder_image_and_tag `grep --color=never cpp-builder: /repo/esecjos/epg/up/ruleset/images.yaml | awk '{print $3}'`
#Run from pcg home
docker run --rm -it --init --user `id -u`:`id -g` --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --volume ${PWD}:${PWD} --workdir ${PWD} ${builder_image_and_tag} gdb;
