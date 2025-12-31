" --------- Tools Menu
" very simple popup. Press ESC to close it without a selection.
" to check if VIM was compiled with the +popupwin feature:
" :echo has('popupwin')

" ------ popup menu colors:
"highlight Pmenu ctermbg=gray guibg=gray   " doesn't work
"Pmenu – normal item
"PmenuSel – selected item
"PmenuSbar – scrollbar
"PmenuThumb – thumb of the scrollbar
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
highlight TopColor     ctermfg=Yellow ctermbg=Black
highlight RightColor   ctermfg=Yellow ctermbg=Black
highlight BottomColor  ctermfg=Yellow ctermbg=Black
highlight LeftColor    ctermfg=Yellow ctermbg=Black

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

"highlight PopupBorder ctermfg=white ctermbg=black guifg=#ffffff guibg=#000000

" ------ functions:
function! SelectTool(id, result)
    " ' 1. Toggle File Explorer',
    if a:result == 1
		20Lexplore
    endif

    " ' 2. Spellcheck menu',
    if a:result == 2
		call PopupSpellchecks()
    endif

    " ' 3. Keyboard Layouts',
    if a:result == 3
		call PopupLayouts()
    endif

    " ' 4. Toggle number',
    if a:result == 4
		setlocal number!
    endif

	" ' 5. Toggle relativenumber',
    if a:result == 5
		setlocal relativenumber!
    endif

	" ' 6. Toggle auto-closing brackets',
    if a:result == 6
		call TogglePairing()
    endif

	" ' 6. Toggle auto-closing brackets',
	" ' 7. :set list!',
    if a:result == 7
		set list!
    endif

	" ' 8. :setlocal foldmethod=indent',
    if a:result == 8
		setlocal foldmethod=indent
    endif

    " ' 9. Reload custom highlights',
    if a:result == 9
		source ~/.vim/config/highlights.vim
    endif

	" '10. VIM cheatsheet',
    if a:result == 10
		80vsp ~/.vim/config/vim_cheatsheet.md
    endif

    " '11. Edit ~/.vimrc',
    if a:result == 11
		vsp ~/.vimrc
    endif

    " '12. Reload ~/.vimrc',
    if a:result == 12
		source ~/.vimrc
    endif
endfunction

" --------- Tool functions
" ------ auto pairing brackets

let s:PairingsState=0

function! s:PairingEnable()
    let s:PairingsState = !s:PairingsState
	" auto-enclosing brackets for coding, '<>' for HTML :
	inoremap ( ()<ESC>i
	inoremap [ []<ESC>i
	inoremap { {}<ESC>i
	inoremap < <><ESC>i
	inoremap " ""<ESC>i
	inoremap ' ''<ESC>i
	" auto-enclosing quotation marks for writing:
	inoremap <M-[> ⟨⟩<ESC>i
	inoremap <M-a> “”<ESC>i
	inoremap <M-z> ‘’<ESC>i
	inoremap <M-k> «»<ESC>i
	inoremap <M-,> ‹›<ESC>i
	" jump out of enclosure - only works with ([{}]):
	inoremap jl <ESC>%%a
endfunction

function! s:PairingDisable()
    let s:PairingsState = !s:PairingsState
	iunmap (
	iunmap [
	iunmap {
	iunmap <
	iunmap "
	iunmap <M-[>
	iunmap <M-a>
	iunmap <M-z>
	iunmap <M-k>
	iunmap <M-,>
	iunmap jl
endfunction

function! s:TogglePairing()
    if s:PairingsState
		call s:PairingDisable()
    else
		call s:PairingEnable()
    endif
endfunction

" ---------  pop-up
function! PopupTools()
	call popup_menu([
    \ ' 1. Toggle File Explorer',
    \ ' 2. Spellcheck menu',
    \ ' 3. Keyboard Layouts',
    \ ' 4. Toggle number',
	\ ' 5. Toggle relativenumber',
	\ ' 6. Toggle auto-closing brackets',
	\ ' 7. :set list!',
	\ ' 8. :setlocal foldmethod=indent',
    \ ' 9. Reload custom highlights',
	\ '10. VIM cheatsheet',
    \ '11. Edit ~/.vimrc',
    \ '12. Reload ~/.vimrc',
    \ ], #{
	\ relative: "win",
	\ pos: 'center',
    \ title: "─",
    \ callback: 'SelectTool',
    \ highlight: 'Question',
	\ borderhighlight: ['TopColor','RightColor','BottomColor','LeftColor'],
    \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
	\ border: [1,1,1,1],
    \ close: 'click',
    \ padding: [1,3,1,3],
    \ })
endfunction

" ------ mapping:
nnoremap <leader><leader> :call PopupTools()<CR>
nnoremap <leader>t :call PopupTools()<CR>
nnoremap <leader>[ :call <SID>PairingEnable()<cr>
nnoremap <leader>] :call <SID>PairingDisable()<cr>

