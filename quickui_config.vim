
""""""""""""""""""""Quickui Example, and experimental """""""""""""""

" clear all the menus
call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
            \ [ "&New File\tCtrl+n", 'echo 0' ],
            \ [ "&Open File\t(F3)", 'echo 1' ],
            \ [ "&Close", 'echo 2' ],
            \ [ "--", '' ],
            \ [ "&Save\tCtrl+s", 'echo 3'],
            \ [ "Save &As", 'echo 4' ],
            \ [ "Save All", 'echo 5' ],
            \ [ "--", '' ],
            \ [ "E&xit\tAlt+x", 'echo 6' ],
            \ ])

" items containing tips, tips will display in the cmdline
call quickui#menu#install('&Edit', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&Find', 'echo 3', 'help 3' ],
            \ ])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
			\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
			\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
			\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
			\ ])

call quickui#menu#install('&Tags', [
           \ ['Generate EPG tags <C-x><C-x><C-T>', '<C-x><C-x><C-T>'],
           \ ['Generate C++ library tags <C-x><C-x><C-L>', '<C-x><C-x><C-L>'],
           \ ['Generate C library tags <C-x><C-x><C-N>', '<C-x><C-x><C-N>'],
           \ ['Generate tags for current dir <C-x><C-t>', '<C-x><C-t>'],
            \ ])

" register HELP menu with weight 10000
call quickui#menu#install('H&elp', [
			\ ["&Cheatsheet", 'help index', ''],
			\ ['T&ips', 'help tips', ''],
			\ ['--',''],
			\ ["&Tutorial", 'help tutor', ''],
			\ ['&Quick Reference', 'help quickref', ''],
			\ ['&Summary', 'help summary', ''],
			\ ], 10000)

call quickui#menu#install('&C/C++', [
            \ [ '&Compile', 'echo 1' ],
            \ [ '&Run', 'echo 2' ],
            \ ], '<auto>', 'c,cpp')



function! SearchBox()
	let cword = expand('<cword>')
	let title = 'Enter text to search:'
	let text = quickui#input#open(title, cword, 'search')
	if text != ''
		let text = escape(text, '[\/*~^')
		call feedkeys("\<ESC>/" . text . "\<cr>", 'n')
	endif
endfunc

function DisplaySearch()

  let l:content = [
              \ ["&Help Keyword\t\\ch", 'echo 100' ],
              \ ["&Signature\t\\cs", 'echo 101'],
              \ ['-'],
              \ ["Find in &File\t\\cx", 'echo 200' ],
              \ ["Find in &Project\t\\cp", 'echo 300' ],
              \ ["Find in &Defintion\t\\cd", 'echo 400' ],
              \ ["Search &References\t\\cr", 'echo 500'],
              \ ['-'],
              \ ["&Documentation\t\\cm", 'echo 600'],
              \ ]
  " set cursor to the last position
  let l:opts = {'index':g:quickui#context#cursor}
  call quickui#context#open(content, opts)
endfunc


" display vim messages in the textbox
function! DisplayMessages()
    let x = ''
    redir => x
    silent! messages
    redir END
    let x = substitute(x, '[\n\r]\+\%$', '', 'g')
    let content = filter(split(x, "\n"), 'v:key != ""')
    let opts = {"close":"button", "title":"Vim Messages"}
    call quickui#textbox#open(content, opts)
endfunc

function! TermExit(code)
    echom "terminal exit code: ". a:code
endfunc

function GetPythonTerminal()
  let l:opts = {'w':60, 'h':8, 'callback':'TermExit'}
  let l:opts.title = 'Terminal Popup'
  call quickui#terminal#open('python', opts)
endfunc

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>


""""""""""""""""""""End Quickui""""""""""""""""""""""""""""""""""""""
