#!/bin/bash

ctags -R --c-kinds=+px --c++-kinds=+p --fields=+iaSKns --extra=+qf --exclude='*.js' --exclude='*.jpg' --exclude='*.so' --exclude='buildout' -f /home/esecjos/tags/tags_cpp /repo/esecjos/workspace/code/
