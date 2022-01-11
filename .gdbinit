set pagination off
set loggin file gdb.output
set logging on
set debug-file-directory /home/esgops/lib
show debug-file-directory
directory /repo/esecjos/workspace/code/
set solib-search-path /repo/esecjos/workspace/code/
set listsize 40
set print symbol-filename on
set print symbol on
set print array on
set print array-indexes on
set print pretty on
set print demangle on
set print object on
set print static-members on
set print vtbl on
define bsave
    save breakpoints ~/.breakpoints
end

define brestore
   source ~/.breakpoints
end
set breakpoint pending on
set confirm off
set print thread-events
brestore

set print elements 300

set substitute-path ../../ /repo/esecjos/workspace/code/epg/
set substitute-path .build/IPOS_ssc/../../ /repo/esecjos/workspace/code/epg/
