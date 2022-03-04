set pagination off
#Autoload local .gdbinit if there is one.
set auto-load local-gdbinit on
set loggin file gdb.output
set logging on
set debug-file-directory /repo/esecjos/
show debug-file-directory
directory /repo/esecjos/
set solib-search-path /repo/esecjos/
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

#set substitute-path ../../ /repo/esecjos/pg/
set substitute-path ./build/IPOS_ssc/../../ /repo/esecjos/epg/
#set substitute-path ./build/IPOS_ssc/../.. .
set history save on
set history size 1000
set history remove-duplicates 50
