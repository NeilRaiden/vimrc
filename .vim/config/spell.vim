" --------- Keybaord Layouts Menu
" very simple popup. Press ESC to close it without a selection.
" to check if VIM was compiled with the +popupwin feature:
" :echo has('popupwin')

" --------- main popup window: PopupSpellchecks
" ------ functions: SpellFunction

" ------ popup menu colors:
"highlight Pmenu ctermbg=gray guibg=gray   " doesn't work
"Pmenu       – normal item
"PmenuSel    – selected item
"PmenuSbar   – scrollbar
"PmenuThumb  – thumb of the scrollbar
" 1
"hi Pmenu ctermfg=black ctermbg=DarkGreen 
"hi PmenuSel ctermfg=white ctermbg=DarkGreen  
" 2
"highlight Pmenu      ctermfg=2 ctermbg=3 guifg=#ff0000 guibg=#00ff00
"highlight PmenuSel   ctermfg=2 ctermbg=3 guifg=#ff0000 guibg=#00ff00
"highlight PmenuSbar  ctermfg=2 ctermbg=3 guifg=#ff0000 guibg=#00ff00
"highlight PmenuThumb ctermfg=2 ctermbg=3 guifg=#ff0000 guibg=#00ff00
" 3
"highlight Pmenu NONE
" 4
"highlight clear Pmenu
"highlight clear PmenuSel
"highlight Pmenu cterm=inverse
"highlight PmenuSel cterm=bold ctermfg=1 ctermbg=LightGreen
" borderhighlight: 
highlight TopColor     ctermfg=White ctermbg=Black
highlight RightColor   ctermfg=White ctermbg=Black
highlight BottomColor  ctermfg=White ctermbg=Black
highlight LeftColor    ctermfg=White ctermbg=Black

" borderhighlight: ['TopColor', 'RightColor', 'BottomColor, 'LeftColor']
"	\ highlight: 'WarningMsg',
"	\ scrollbarhighlight
"	\ thumbhighlight
"	border		List with numbers, defining the border thickness
"			above/right/below/left of the popup (similar to CSS).
"			Only values of zero and non-zero are currently
"			recognized.  An empty list uses a border all around.
"	borderhighlight	List of highlight group names to use for the border.
"			When one entry it is used for all borders, otherwise
"			the highlight for the top/right/bottom/left border.
"			Example: ['TopColor', 'RightColor', 'BottomColor, 'LeftColor']

highlight PopupBorder ctermfg=white ctermbg=black guifg=#ffffff guibg=#000000

" ------ recompile wordlists into .spl files:

""for d in glob('~/.vim/spell-add/*.add', 1, 1)
"for d in glob('~/.vim/spell/*.add', 1, 1)
"    if filereadable(d) && (!filereadable(d . '.spl') || getftime(d) > getftime(d . '.spl'))
"        exec 'silent mkspell! ' . fnameescape(d)
"    endif
"endfor   

" ------ functions: SpellFunction
function! SpellFunction(id, result)

	" 1 'Disable spellcheck'
    if a:result == 1
		setlocal nospell
    endif

	" 2 'Spellcheck en_US'
    if a:result == 2
		setlocal spell spelllang=en_us
    endif

	" 3 'Spellcheck en_GB'
    if a:result == 3
		setlocal spell spelllang=en_gb
    endif

	" 4 'Spellcheck custom'
    if a:result == 4
		" 1. recompile MyLexicon (_.spl_ file must be in ~/.vim/spell/ directory):
		exec 'mkspell! ~/.vim/spell/MyLexicon.utf-8.spl ~/.vim/spell-add/MyLexicon.utf-8.add'
		" 2. activate spell-check ('.add' file can be anywhere, for example ~/.vim/spell-add/ directory):
		setlocal spell spelllang=MyLexicon spellfile=~/.vim/spell-add/MyLexicon.utf-8.add
    endif

	" '5. Spellcheck PhoneticUS',
    if a:result == 5
		exec 'mkspell! ~/.vim/spell/PhonemUS.utf-8.spl ~/.vim/spell-add/PhonemUS.utf-8.add'
		exec 'mkspell! ~/.vim/spell/KRLus.utf-8.spl ~/.vim/spell-add/KRLus.utf-8.add'
		setlocal spell spelllang=KRLus,PhonemUS spellfile=~/.vim/spell-add/KRLus.utf-8.add,~/.vim/spell-add/PhonemUS.utf-8.add
    endif

	" '6. Spellcheck PhoneticUK',
    if a:result == 6
		exec 'mkspell! ~/.vim/spell/PhonemUK.utf-8.spl ~/.vim/spell-add/PhonemUK.utf-8.add'
		exec 'mkspell! ~/.vim/spell/KRLuk.utf-8.spl ~/.vim/spell-add/KRLuk.utf-8.add'
		setlocal spell spelllang=KRLuk,PhonemUK spellfile=~/.vim/spell-add/KRLuk.utf-8.add,~/.vim/spell-add/PhonemUK.utf-8.add
    endif

	" '7. Spellcheck en_us,ShavianUS',
    if a:result == 7
		exec 'mkspell! ~/.vim/spell/ShavianUS.utf-8.spl ~/.vim/spell-add/ShavianUS.utf-8.add'
		exec 'mkspell! ~/.vim/spell/KRLus.utf-8.spl ~/.vim/spell-add/KRLus.utf-8.add'
		setlocal spell spelllang=KRLus,ShavianUS spellfile=~/.vim/spell-add/KRLus.utf-8.add,~/.vim/spell-add/ShavianUS.utf-8.add
    endif

	" '8. Spellcheck en_gb,ShavianUK',
    if a:result == 8
		exec 'mkspell! ~/.vim/spell/ShavianUK.utf-8.spl ~/.vim/spell-add/ShavianUK.utf-8.add'
		exec 'mkspell! ~/.vim/spell/KRLuk.utf-8.spl ~/.vim/spell-add/KRLuk.utf-8.add'
		setlocal spell spelllang=KRLuk,ShavianUK spellfile=~/.vim/spell-add/KRLuk.utf-8.add,~/.vim/spell-add/ShavianUK.utf-8.add
    endif

	" 9 'Dump spell errors to file'
    if a:result == 9
		" add NewWords.utf-8.add to the spellfile list
		setlocal spellfile+=NewWords.utf-8.add
		exec 'mkspell! ~/.vim/spell/NewWords.utf-8.spl ~/.vim/spell-add/NewWords.utf-8.add'
		" todo: macro building doesn't work - fix it
		" jump to top
		"exec 'norm! go'
		" --- clear macro "a"
		normal! qaq<Esc>
		"exec 'norm! qaq'
		" --- create recursive macro "@a" (recursive = it runs itself at the end)
		" qa  - start recoding macro "@a"
		" ]S  - jump to next SpellBad word not in spellcheck (skip SpellCap words)
		" 2zg - add word under cursor to 2nd spellfile (assuming NewWords.utf-8.add)
		" @a  - replay macro "@a" (this macro) withing itself
		" q   = stop recording macro
		normal! qa]S2zg@aq<cr>
		"exec 'norm qa]S2zg@aq'
		" run macro "a" 
		"- it will dump "SpellBad" words (skipping "SpellCap") to 2-nd spellfile in local directory
		norm! @a<cr>
		"exec 'norm! @a'
		"exec ':%normal @a'
    endif

	" '10. Spellcheck KRL',
    if a:result == 10
		exec 'mkspell! ~/.vim/spell/KRL.utf-8.spl ~/.vim/spell-add/KRL.utf-8.add'
		setlocal spell spelllang=KRL spellfile=~/.vim/spell-add/KRL.utf-8.add
    endif

endfunction

" --------- functions:

"function! FunctionName()
"	let g:layout = "Variable"
"endfunction

" ---------  main pop-up 
function! PopupSpellchecks()
	let lines = winheight(0)
	let columns = winwidth(0)
  call popup_menu([
    \ '1. Disable spellcheck',
    \ '2. Spellcheck en_us',
    \ '3. Spellcheck en_gb',
    \ '4. Spellcheck MyLexicon',
    \ '5. Spellcheck KRLus+phonetic_us',
    \ '6. Spellcheck KRLgb+phonetic_gb',
    \ '7. Spellcheck KRLus+ShavianUS',
    \ '8. Spellcheck KRLgb+ShavianUK',
    \ '9. Dump spell errors to file',
    \ '10. Spellcheck KRL (us+uk)',
    \ ], #{
	\ relative: "win",
    \ line: &lines - 2,
    \ col:  &columns,
	\ pos: 'botright',
    \ title: "─ Spell options: ─",
    \ callback: 'SpellFunction',
    \ highlight: 'Question',
	\ borderhighlight: ['TopColor','RightColor','BottomColor','LeftColor'],
    \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
	\ border: [1,1,1,1],
    \ close: 'click',
    \ padding: [1,3,1,3],
    \ })

endfunction

nnoremap <leader>s :call PopupSpellchecks()<CR>
"nnoremap <leader>s :setlocal spell!<cr>
" --------- end
