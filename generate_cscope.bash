#!/bin/bash

DPI_DIR=/repo/esecjos/cdpi-main
EPG_DIR=/repo/esecjos/epg
CSCOPE_DIR=/repo/esecjos/cscope

find $DPI_DIR -path $DPI_DIR/.ccls-cache -prune -o -name "*.h" -or -name "*.c" -or -name "*.cc" > $CSCOPE_DIR/cscope.files
find $EPG_DIR -path $EPG_DIR/.ccls-cache -prune -o -path $EPG_DIR/staging -prune -o -name "*.h" -or -name "*.c" -or -name "*.cc" >> $CSCOPE_DIR/cscope.files

cd $CSCOPE_DIR
cscope -b -q -k


