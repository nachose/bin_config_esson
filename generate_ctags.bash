#!/bin/bash

CTAGS_DIR=/repo/esecjos/tags

rm -r $CTAGS_DIR/tags*

ctags -R --c-kinds=+px --c++-kinds=+p --fields=+iaSKns --extra=+qf --excmd=number --exclude='*.js' --exclude='*.jpg' --exclude='*.so' --exclude='*.o' --exclude='*.html' --exclude='buildout' --exclude='tools' --exclude='.ccls-cache' --exclude='*.txt' --exclude='*.conf' --exclude='*.rst' --exclude='*.css' --totals=yes -f $CTAGS_DIR/tags_cpp /repo/esecjos/
ctags -R --c++-kinds=+p --fields=+iaSKns --extra=+qf --totals=yes --excmd=number -f $CTAGS_DIR/tags_std_library /proj/epg-tools/compilers/ericsson-clang9.0.1-008cfeee88-rhel7.6-binutils2.32-stdlibgcc9.2.0/include/c++/9.2.0
ctags -R --c-kinds=+px --fields=+iaSKns --extra=+qf --totals=yes --excmd=number -f $CTAGS_DIR/tags_c_library /usr/include/
