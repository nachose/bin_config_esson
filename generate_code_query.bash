#!/bin/bash 

CODE_QUERY_DIR=/repo/esecjos/tags

cd $CODE_QUERY_DIR
cqmakedb -s ./myproject.db -c ./cscope.out -t ./tags_cpp -t ./tags_std_library -t ./tags_c_library -p
