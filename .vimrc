":profile start profile.log
":profile func *
":profile file *
" At this point do slow actions

"filetype plugin on       " enable plugins

runtime ftplugin/man.vim
runtime macros/matchit.vim

"leader is _
let mapleader = "_"

set incsearch            "incremental search
set ignorecase           "ignore case in searchs
set smartcase            "Ignore command ignorecase if the is some uppercase letter"
set scrolloff   =1       "at least 1 line of margin in top and bottom
set history     =50
set autoread             "autorefresh files when updated by another program
set ruler                "add ruler with line, column at the bottom-right
set tabstop     =4
set shiftwidth  =4
set expandtab            "tabs are filled with spaces
set langmenu    =es_es.utf8
set encoding    =utf-8   "file encoding
set cindent              "indentation c style
set cinkeys-=0#          "Following two lines are for python, so that it doesn't place it in the first column
set indentkeys-=0#
set showmatch            "show matching parenthesis.
set showcmd              "show partial commands"
set showmode             "show current mode.
set nobackup             "do not backup files.
set hlsearch             "highlight search"
set tabpagemax =100      "100 tabs.
set list                 "See non visible characters
set clipboard=unnamed,unnamedplus "Usar * y + para copiar al portapapeles del sistema.
set wrapscan             "When arriving to the end of the file, start again from the top.
syntax on                "syntax is active
filetype on              "filetype detection
set viminfo='40,<50,s10,h "value for vim info, it's the default value and I've only changed first parameter, to have 40 files in :oldfiles or :browse oldfiles list, mru
"set termguicolors        "Set real color

set switchbuf+=usetab,newtab "Use tab that already exists while changing, new tab when opening new buffer
"Set the preview window in a hover, instead of a window
"set previewpopup=height:10,width:120
"Search down into subfolders
"set path+=**
"Activate wildmenu to Complete
"set wildmenu
"


set backspace=indent,start,eol   "indent ->allows to delete indents
"eol    ->allows to delete line breaks.
"start  ->allows to move before the
"beginning of the editing.

set shortmess+=T "No hace falta pulsar <Enter> cuando hay un error.

set nu                   "line numbers in the left
"pliegues activados.
set foldenable
"activar plegado por tabulación.
set foldmethod=indent
"activar plegado manual.
"set foldmethod=manual
"nivel de plegado a partir de 1 tabulación.
set foldlevel=10
set ballooneval
set balloonevalterm
"""""""""""""""""""""Mouse settings """""""""""""""""
set mouse=a
set ttymouse=xterm

"Omnicompletion options
set omnifunc=syntaxcomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Beggining of vim.plug
"Specify directory of plugins
call plug#begin('~/.vim/plugged')

"Nerd tree
Plug 'scrooloose/nerdtree'
"Sensible defaults
Plug 'tpope/vim-sensible'
"C/C++ ide
Plug 'WolfgangMehner/c-support'
"Bash ide
"Plug 'WolfgangMehner/bash-support'
"Taglist source code browser
Plug 'yegappan/taglist'
"Tab completion
Plug 'ervandew/supertab'
"Vim surround
Plug 'tpope/vim-surround'
"Alternate between cpp and h
Plug 'dantler/vim-alternate'
"Autocomplete, not from github
Plug '~/.vim/plugged/autocomplpop/'
"VCScommands, not from github
Plug '~/.vim/plugged/vcscommand/'
"Refactor plugin, not from github
Plug '~/.vim/plugin/'
"Cpp completion
Plug 'vim-scripts/OmniCppComplete'
"Easier marks
Plug 'kshenoy/vim-signature'
"Vim gutter
Plug 'airblade/vim-gitgutter'
"Airline, plugin for statusline
Plug 'vim-airline/vim-airline'
"FZF plugin
Plug 'junegunn/fzf'
"FZF mappings
Plug 'junegunn/fzf.vim'
"FZF preview, one of them, there are several.
Plug 'chengzeyi/fzf-preview.vim'
"FZF tags, to improve navigation of tags.
Plug 'zackhsi/fzf-tags'
"Vim startify
Plug 'mhinz/vim-startify'
"MRU plugin
"Plug 'yegappan/mru'
"Better gf (go to file)
Plug 'amix/open_file_under_cursor.vim'
"Autoreload
Plug 'djoshea/vim-autoread'
"vim-commentary
Plug 'tpope/vim-commentary'
"Additional c++ syntaxk highlight
Plug 'octol/vim-cpp-enhanced-highlight'
"Rainbow parentheses
Plug 'kien/rainbow_parentheses.vim'
"Better whitespace highlight
Plug 'ntpeters/vim-better-whitespace'
"gv git commit browser
Plug 'junegunn/gv.vim'
"fugitive, is needed by gv
Plug 'tpope/vim-fugitive'
"Ale, asynchronous replacement for syntastic
Plug 'dense-analysis/ale'
"Easy align plugin
Plug 'junegunn/vim-easy-align'
"Repeat for plugins
Plug 'tpope/vim-repeat'
"Another alternate to test.
Plug 'kuznetsss/shswitch'
"Syntax for log files
Plug 'dzeban/vim-log-syntax'


"Some colorschemes"
Plug 'andreasvc/vim-256noir'
Plug 'jdsimcoe/abstract.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-vividchalk'
Plug 'joshdick/onedark.vim'


"End. Initialize plugin system
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <c-tab> <c-r>=CompleteTab()<cr>

set background=dark
"colorscheme vividchalk
colorscheme afterglow
"Open quicfix items in new tab
autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T


"""""""""""""""""""""""""""""""""""""""  TAGS  """"""""""""""""""""""
noremap <C-x><C-x><C-T> :!ctags -R --c-kinds=+px --c++-kinds=+p --fields=+iaSKns --extra=+qf --excmd=number --exclude='*.js' --exclude='*.jpg' --exclude='*.so' --exclude='*.o' --exclude='*.html' --exclude='buildout' --exclude='tools' --exclude='3pp' --totals=yes -f /repo/esecjos/tags/tags_cpp /repo/esecjos/

"Generation of tags
"noremap <C-x><C-x><C-T> :!ctags -R --c-kinds=+px --c++-kinds=+p --fields=+iaS --extra=+q --exclude='*.js' --exclude='*.jpg' --exclude='*.so' --exclude='epg' -f /home/esecjos/tags/tags_cpp /repo/esecjos/
set tags+=/repo/esecjos/tags/tags_cpp
noremap <C-x><C-x><C-L> :!ctags -R --c++-kinds=+p --fields=+iaSKns --extra=+qf --totals=yes --excmd=number -f /repo/esecjos/tags/tags_std_library /proj/epg-tools/compilers/ericsson-clang9.0.1-008cfeee88-rhel7.6-binutils2.32-stdlibgcc9.2.0/include/c++/9.2.0
set tags+=/repo/esecjos/tags/tags_std_library
noremap <C-x><C-x><C-N> :!ctags -R --c-kinds=+px --fields=+iaSKns --extra=+qf --totals=yes --excmd=number -f /repo/esecjos/tags/tags_c_library /usr/include/
set tags+=/repo/esecjos/tags/tags_c_library
" -- ctags --
" noremap <ctrl-x>+<ctrl-t> to generate ctags for current folder:
noremap <C-x><C-t> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" add current directory's generated tags file to available tags
set tags+=./tags

"Remap _tag to do a lookup tag
"nnoremap <leader>tag yiw:tag <C-r>"<CR>
"Remap to lookup a tag and open in other tag
nnoremap <leader>ta :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"Remap _ptag to make a preview tag
nnoremap <leader>pta yiw:ptag <C-r>"<CR>
"Remap _psearch to see definition of symbol in window
"nnoremap <leader>pw _psearch <C-R><C-W><CR>
"Open tag in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
"Open tag in new split
map <leader><C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Autocomplete options.
set completeopt=menu,menuone,preview

""""""" NerdTree config """""
nnoremap <F2> :NERDTreeToggle %<CR>
"Show hidden files
let NERDTreeShowHidden= 1
"Close nerdtree after opening a file.
let g:NERDTreeQuitOnOpen = 1




" --- OmniCppComplete ---
" -- configs --
let OmniCpp_MayCompleteDot      = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow    = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope    = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem     = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch     = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
let OmniCpp_LocalSearchDecl     = 1 " don't require special style of function opening braces

"""""""""""""""""""""""""   Vim Signature configuration """"""""""""""""
let g:SignatureMap = {
    \ 'Leader'             :  "m",
    \ 'ToggleMarkAtLine'   :  "m.",
    \ 'GotoNextSpotByPos'  :  "mn",
    \ 'GotoPrevSpotByPos'  :  "mp",
    \ 'ListBufferMarks'    :  "m/"
    \ }
let g:SignatureWrapJumps = 1
let b:SignatureWrapJumps = 1



"""""""""""""" Taglist options """"""
nnoremap <F5> :TlistToggle<CR>
let Tlist_Show_One_File = 1 "Display tags of multiple files at different times, only the current file's

"""""""""""""" GV options, git commit browser """"""""
"Log of commits
nnoremap <F6> :GV<CR>
"Commits for this file
nnoremap <F7> :GV!<CR>
"Create quickfix list with revisions of this file
nnoremap <F8> :GV?<CR>


""""Sesiones"""""
noremap <F3> : mksession! /home/esecjos/nacho_vim_session<CR>
noremap <F4> : source     /home/esecjos/nacho_vim_session<CR>
set sessionoptions+=curdir
set sessionoptions+=help
set sessionoptions+=tabpages
set sessionoptions-=localoptions
set sessionoptions-=options    " do not store global and local values in a session
set sessionoptions-=folds      " do not store folds

set noswapfile   "no generar archivos de swap. Si se va la luz me quedo sin los cambios, pero es menos molesto.
set autowrite    "salva el archivo actual al cambiar de buffer.

""""""""""""""""""""Undo persistance"""""""""""""""""""""
set undodir=~/.vim/undodir
set undofile


""""""""""""""""""""""" Autocmds """"""""""""""""""""""""""""
autocmd BufRead *.qs set syntax=javascript         "Si se lee un qs la sintaxis es javascript.
autocmd BufRead *.vim set syntax=vim
autocmd BufRead *.sh set syntax=sh
autocmd BufRead *.bash set syntax=bash
au BufRead *.html set filetype=htmlm4  "Syntax of html + javascript
"Change colorscheme when entering and leaving insert mode
"autocmd InsertEnter * :colorscheme onedark
"autocmd InsertLeave * :colorscheme vividchalk
autocmd InsertEnter * set cursorcolumn
autocmd InsertLeave * set nocursorcolumn
autocmd FileChangedShell * echohl WarningMsg | echo "File has been changed outside of vim." | echohl None
autocmd FileType yaml set tabstop=2 shiftwidth=2 "yaml files have a tab of two characters

"""""""""""""""""" Tab management """"""""""""""""""""""""""""""""""""""""""""
"Ctrl-t para una nueva pestaña
nnoremap <C-t> :tabe<CR>
"Ctrl +x para cerrar pestañas.
:nnoremap <c-x> :clo<cr>
"Ctrl + e para una nueva pestaña.
:nnoremap <c-e> :tabe<cr>


" """"""""""""""""""""""""""""""""
" Marcadores de linea y columna.
" """"""""""""""""""""""""""""""""
set cursorline
"quitar el cursor line.
"set nocursorline
"Poner el marcador de columna.
"set cursorcolumn
"Quitar el marcador de columna.
"set nocursorcolumn
"""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""
"Mapeos propios (de Nacho)
""""""""""""""""""""""""""""""""""""""
"Mapear en modo inserción el Ctrl + S a salvar.
inoremap <C-s> <ESC>:w<CR>
inoremap <C-S> <ESC>:w<CR>
"Mapear te para hacer un :tabedit %
nnoremap te :tabedit %<CR>

"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alternate plugin
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Experimental, pongo esta variable global a 1 para que solamente tome paths
" locales.
let g:alternateRelativeFiles = 1

let g:alternateExtensions_h = "c,cpp,cxx,cc,CC"
let g:alternateExtensions_H = "C,CPP,CXX,CC"
let g:alternateExtensions_cpp = "h,hpp"
let g:alternateExtensions_CPP = "H,HPP"
let g:alternateExtensions_cc = "h,hpp"
let g:alternateExtensions_CC = "H,HPP"
let g:alternateExtensions_c = "h"
let g:alternateExtensions_C = "H"
let g:alternateExtensions_cxx = "h"

let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,../include/*,sfr:../../src'

"""""" grep configuration """"""
command! -nargs=+ Mygrep execute 'silent grep! --color=never <args>' | copen 7

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""Refactor plugin"""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ic  :call IntroduceConstant()<CR>
nnoremap <leader>rp  :call ReorderParameters()<CR>
nnoremap <leader>rvp :call RemoveParameter()<CR>
nnoremap <leader>rv  :call RenameVariable()<CR>
nnoremap <leader>lvp :call LocalVariableToParameter()<CR>
vnoremap <leader>em  :call ExtractMethod()<CR>



"Select inner word.
nnoremap <space> viw
"Lower line one line.
nnoremap + ddp
"Rise line one line.
nnoremap - ddkP
"Delete line in insert mode.
inoremap <c-d> <esc>ddi
"Uppercase inner word
inoremap <c-u> <esc>viwUi
"Uppercase inner word.
nnoremap <c-u> viwU<esc>
"Seleccionar el interior de parentesis
nnoremap <c-z> vi{
"Seleccionar e indentar.
nnoremap <c-k><c-f> vi{=
"Surround word with "
:nnoremap <leader>" viw<esc>i"<esc>hbi"<esc>lel
"Surround word with '
:nnoremap <leader>' viw<esc>i'<esc>hbi'<esc>lel
"Surround with ()
:nnoremap <leader>( viw<esc>i)<esc>hbi(<esc>lel
"Surround selected text with ".
:vnoremap <leader>a" `<vi"<esc>`>i"<esc>
"Escape of insert mode with kj
:inoremap kj <esc>
"Ctrl+Inicio para ir al primer tab.
:nnoremap <c-Home> :tabr<cr>
"Ctrl+Fin para ir al ultimo tab.
:nnoremap <c-End> :tabl<cr>
"set syntax=cpp
:nnoremap <leader>cpp :set syntax=cpp<cr>
"set syntax=js
:nnoremap <leader>js :set syntax=js<cr>
"move tab + 1
:nnoremap <c-+> :tabm +1<cr>
"move tab - 1
:nnoremap <c--> :tabm -1<cr>
"no higlight mapped to _nh
:nnoremap _nh :noh<cr>
"close all tabs.
:nnoremap <leader>tca :tabdo tabc<cr>
"remove writing restrictios for this file.
:nnoremap <leader>rwr :!chmod a+w %<cr>:edit<cr>

let g:Tlist_Ctags_Cmd = '/usr/bin/ctags'
let g:Tlist_WinWidth = 50

"Autocomplete menu colors.
":highlight Pmenu guibg=CornflowerBlue
":highlight Pmenu guifg=Black
":highlight PmenuSel guibg=Black
":highlight PmenuSel guifg=CornflowerBlue

"Create doxygen header of function.
:nnoremap <leader>d :Dox<CR>
let g:DoxygenToolkit_paramTag_post = " [in] "

"Directory of execution is that of Forandesa.
"cd c:\workcopy\ForanDesa\src\

"Try to get the correct directory.
"autocmd BufReadPost *.cpp cd %:p:h/
"autocmd BufReadPost *.cc  cd %:p:h/
"autocmd BufReadPost *.h   cd %:p:h/
"autocmd BufReadPost *.hh  cd %:p:h/
"autocmd BufReadPost *.c   cd %:p:h/
"autocmd BufReadPost *.qs  cd %:p:h/
"autocmd BufReadPost *.fcs cd %:p:h/
"autocmd TabEnter    *.*   cd %:p:h/

"Save automatically all files when focus lost.
:au FocusLost * silent! wa

"Set list of characters to be seen when using command :set list. Whatever is not this is then a simple whitespace
:set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"You complete me pluging

"Surround by tags of comments.
"nnoremap yss<%-- <leader>mmm

"Map to show words like this in this file and jump to one of them
nnoremap [I [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
nnoremap ]I ]I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

":profile pause
":noautocmd qall!
"
"""""""""""""""""""" Unite.vim config """""""""""""
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
"nnoremap <leader>r :<C-u>Unite -start-insert file_rec<CR> 


"""""" gitgutter config """""
"Disable all mappings
let g:gitgutter_map_keys = 0
nnoremap <leader>gn :GitGutterNextHunk<CR>
nnoremap <leader>gp :GitGutterPrevHunk<CR>
"Run gitgutter in asynchronous mode
let g:gitgutter_async = 1
"Show message when jumping
let g:gitgutter_show_msg_on_hunk_jumping = 1


"Remap fzf a ctrlp
nmap <C-P> :FZF<CR>
"Consider dash(-) not a separator for searching
"set iskeyword+=-

"Handle ctrl arrow keys, because they do not work with screen
map  <Esc>[1;5A <C-Up>
map  <Esc>[1;5B <C-Down>
map  <Esc>[1;5D <C-Left>
map  <Esc>[1;5C <C-Right>
cmap <Esc>[1;5A <C-Up>
cmap <Esc>[1;5B <C-Down>
cmap <Esc>[1;5D <C-Left>
cmap <Esc>[1;5C <C-Right>
"
map  <Esc>[1;2D <S-Left>
map  <Esc>[1;2C <S-Right>
cmap <Esc>[1;2D <S-Left>
cmap <Esc>[1;2C <S-Right>

"Startify configuration
"Do not change to dir, and change to vcs root
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1

"Bracketed paste mode, to avoid strange characters while pasting to command line
set t_BE=

"For c or cpp files, set ending spaces as errors
let c_space_errors = 1
"For java files, set ending spaces as errors.
let java_space_errors = 1
"For c and cpp files, do not see space errors in front of tabs.
let c_no_tab_space_error = 1

"Set term xterm, to avoid some errors that were making some of the mappings
"not to work
set term=xterm
"Fix backspace
:if &term == "xterm"
:  set t_kD=^V<Delete>
:endif

"Add current line to matched ones
:nnoremap <silent> <Leader>hl :call matchadd('Search', '\%'.line('.').'l')<CR>
"Clear matches
:nnoremap <silent> <Leader>ch :call clearmatches()<CR>

"Rainbow parentheses config
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

""""""""""""Airline extension""""""""""""""""""""""
"CAPS statusline
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#ale#enabled = 1
"Inactive windows only show name of file, left section is collapsed
let g:airline_inactive_collapse=1
"Inactive windows do have different separators.
let g:airline_inactive_alt_sep=1
"Airline layout
let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'x', 'y', 'z', 'error', 'warning' ] ]
"let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'x', 'y', 'z', 'error'] ]
"Skip empty sections
let g:airline_skip_empty_sections = 1
"fzf integration.
let g:airline#extensions#fzf#enabled = 1
"Integration with gitgutter
let g:airline#extensions#hunks#enabled = 1
"Integration with nerdtree
let g:airline#extensions#nerdtree_statusline = 1

""""""""""" ALE configuration """"""
" Set this. Airline will handle the rest.
let g:ale_completion_enabled = 1
let g:ale_pattern_options_enabled = 1
"Set flags for gcc/clang
let opts_cpp = '-std=c++17 -Wall -Wextra -I/proj/epg-tools/compilers/ericsson-clang9.0.1-008cfeee88-rhel7.6-binutils2.32-stdlibgcc9.2.0/include/c++/9.2.0'
let opts_c = ''
let opts_clang_tidy=opts_cpp . '-- -I/proj/epg-tools/compilers/ericsson-clang9.0.1-008cfeee88-rhel7.6-binutils2.32-stdlibgcc9.2.0/include/c++/9.2.0'
let g:ale_linters = { 'cpp': ['cc', 'gcc', 'clangd', 'cppcheck', 'clangtidy'], 'c': ['cc', 'gcc', 'clangd', 'cppcheck', 'clangtidy'] }
let g:ale_cpp_cc_options    = opts_cpp
let g:ale_cpp_gcc_options   = opts_cpp
let g:ale_cpp_clang_options = opts_cpp
let g:ale_cpp_clangtidy_options=opts_clang_tidy
let g:ale_c_cc_options    = opts_c
let g:ale_c_gcc_options   = opts_c
let g:ale_c_clang_options = opts_c
let g:ale_fixers = { 'cpp': ['trim_whitespace', 'remove_trailing_lines', 'clangtidy'], 'c': ['trim_whitespace', 'remove_trailing_lines', 'clangtidy'] }
let dpi_build_dir='/repo/esecjos/buildout/'
let pcg_build_dir='/repo/esecjos/epg/up/build/'
let epg_build_dir=''
let g:ale_c_build_dir = pcg_build_dir
let g:ale_cpp_build_dir = pcg_build_dir
"let g:ale_c_uncrustify_options = '-c /home/esecjos/my_uncrustify.cfg'
"let g:ale_cpp_uncrustify_options = '-c /home/esecjos/my_uncrustify.cfg'
let g:ale_fix_on_save=1
let g:ale_set_balloons = 1
let g:ale_hover_cursor = 1
let g:ale_set_balloons =1
let g:ale_hover_to_floating_preview =1
let g:ale_floating_preview =1
let g:ale_cursor_detail=1
let g_ale_echo_delay=100 "Milliseconds
let g_ale_close_preview_on_insert=1

"Automatic Hovering
augroup ale_hover_cursor
  autocmd!
  autocmd CursorHold * ALEHover
augroup END

nnoremap <Leader>an :ALENext<CR>
nnoremap <Leader>ap :ALEPrev<CR>
nnoremap <Leader>afr :ALEFindReferences<CR>
nnoremap <Leader>afq :ALEFindReferences -quickfix<CR> :copen<CR>
nnoremap <Leader>af :ALEFix<CR>
nnoremap <Leader>agdd :ALEGoToDefinition<CR>



" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
if has("patch-8.1.0360")
     set diffopt+=internal,algorithm:patience
endif

"Choose an open buffer from the list
"The ending space is intended
nnoremap <Leader>ls :ls<CR>:b 

""Cursor settings, lets see
"if &term =~ "xterm\\|rxvt"
"  " use an orange cursor in insert mode
"  let &t_SI = "\<Esc>]12;orange\x7"
"  " use a red cursor otherwise
"  let &t_EI = "\<Esc>]12;red\x7"
"  silent !echo -ne "\033]12;red\007"
"  " reset cursor when vim exits
"  autocmd VimLeave * silent !echo -ne "\033]112\007"
"endif

"Mappings for merge command
nnoremap <Leader>dg :diffget<CR>
nnoremap <Leader>dp :diffput<CR>

""Alternate between two tabs with <C-tab>
"if !exists('g:lasttab')
"  let g:lasttab = 1
"endif
"nmap <C-tab> :exe "tabn ".g:lasttab<CR>
"au TabLeave * let g:lasttab = tabpagenr()

""""""""""""""""""""" MRU """"""""""""""""
"Create abbreviations for mru list
cabbrev mru browse oldfiles
cabbrev MRU browse oldfiles

"Grep word an open in quicfix window
"map <Leader>gw :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
map <Leader>gw :execute " grep -srnw --color=never --binary-files=without-match --exclude-dir=.git . -e " . expand("<cword>") . " " <bar> cwindow<CR>

""""""""""""""""Vimrc management""""""""""""""""""""
"Mapear _ev a abrir _vimrc.
"nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>ev :tabe $MYVIMRC<CR>
"Reload _vimrc.
nnoremap <leader>sv :source $MYVIMRC<CR>

"""""""""""""""""""""Easy align plugin """"""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""Different colorscheme for vimdiff """"""""""""""""""
if &diff
    colorscheme abstract
endif

"Grep commands
"Grep fow word in current directory
:nnoremap gr :grep -srI --color=never <cword> *<CR>:copen<CR>
"Grep for word in current file directory
:nnoremap Gr :grep -srI --color=never <cword> %:p:h/*<CR>:copen<CR>
"Grep for WORD in current directory
:nnoremap gR :grep -srI --color=never '\b<cword>\b' *<CR>:copen<CR>
"Grep for WORD in current file directory
:nnoremap GR :grep -srI --color=never '\b<cword>\b' %:p:h/*<CR>:copen<CR>

function GrepwordInBaseDirectory()
    :grep -srI --color=never <cword> *
    :copen
endfunction
function GrepwordInFileDirectory()
    :grep -srI --color=never <cword> %:p:h/*
    :copen
endfunction
function GrepWORDInBaseDirectory()
    :grep -srI --color=never '\b<cword>\b' *
    :copen
endfunction
function GrepWORDInFileDirectory()
    :grep -srI --color=never '\b<cword>\b' %:p:h/*
    :copen
endfunction

""""""""""""""""""SWSwitch"""""""""""""""""
"Remainder, the command is :SWSwitch<CR>
"

""""""""""""Functions to add or remove - from keyword """""""""""""""""""""
"Remove - from keywords, affecting searchs
function Enabledash()
    set iskeyword+=-
endfunction
"Add - from keywords, affecting searchs
function Disabledash()
    set iskeyword-=-
endfunction
"Remove -> from keywords, affecting searchs
function EnableSymbols()
    set iskeyword+=-
    set iskeyword+=>
endfunction
"Add -> from keywords, affecting searchs
function DisableSymbols()
    set iskeyword-=-
    set iskeyword-=>
endfunction

"Reinterpret terminal colors, for example of output of grep to see the colorschemes
"instead of the control codes. Output is a terminal window, cannot be modified
function SeeGrepColors()
    :term cat %:p
    :on
endfunction

""""""""""""""""Grep quickfix list """"""""""""""""""""""""
function! GrepQuickFix(pat)
  let all = getqflist()
  for d in all
    if bufname(d['bufnr']) !~ a:pat && d['text'] !~ a:pat
        call remove(all, index(all,d))
    endif
  endfor
  call setqflist(all)
endfunction
command! -nargs=* GrepQF call GrepQuickFix(<q-args>)

""""""""""""""""fzf-tags""""""""""""""""""""""""""""""""""
"Substitue :tag and :tselect
nmap <C-]> <Plug>(fzf_tags)
noreabbrev <expr> ts getcmdtype() == ":" && getcmdline() == 'ts' ? 'FZFTselect' : 'ts'

"""""""""""""""""""""""""""CScope"""""""""""""""""""""""""""""""
function! Cscope(option, query)
  let color = '{ x = $1; $1 = ""; z = $3; $3 = ""; printf "\033[34m%s\033[0m:\033[31m%s\033[0m\011\033[37m%s\033[0m\n", x,z,$0; }'
  let opts = {
  \ 'source':  "cscope -dL" . a:option . " " . a:query . " | awk '" . color . "'",
  \ 'options': ['--ansi', '--prompt', '> ',
  \             '--multi', '--bind', 'alt-a:select-all,alt-d:deselect-all',
  \             '--color', 'fg:188,fg+:222,bg+:#3a3a3a,hl+:104'],
  \ 'down': '40%'
  \ }
  function! opts.sink(lines)
    let data = split(a:lines)
    let file = split(data[0], ":")
    execute 'e ' . '+' . file[1] . ' ' . file[0]
  endfunction
  call fzf#run(opts)
endfunction

" Invoke command. 'g' is for call graph, kinda.
nnoremap <silent> <Leader>sco :call Cscope('3', expand('<cword>'))<CR>
