set pagination off
set loggin file gdb.output
set logging on
set debug-file-directory /home/esgops/lib
show debug-file-directory
directory /home/esgops/bin
set solib-search-path /home/esgops/lib
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

