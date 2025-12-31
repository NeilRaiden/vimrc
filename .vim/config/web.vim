" ------------
" --- open link under cursor in the default web browser
" --- shorcut key: gx
" * on macOS: if "gx" doesn't work, setting `let g:netrw_browsex_viewer="open"` may fix the issue, if it doesn't use the following snippet:
" * on Linux using `setsid xdg-open` or similar commands may be necessary.
set shell=/bin/zsh
function! OpenURLUnderCursor()
	let s:url = expand('<cword>')
	let s:url = substitute(s:url, '\?', '\\?', '')
	let s:url = shellescape(s:url, 1)
	if s:url != ''
		" MacOS:
		silent exec "!open '".s:url."'"
		" Linux:
		"silent exec "!xdg-open '".s:url."'"
		redraw!
	endif
endfunction
" test:
" place cursor on the link https://www.tfd.com and press "gx"
" Note: 
" * on Linux use "gnome-open" or "xdg-open"
" * on Windows 'path to your web browser'

" ------------
" --- open Web Dictionary with word under cursor
" --- shortut key: gy 
function! OpenDictWithWordUnderCursor()
    let l:word = expand('<cword>')
	let l:url = 'https://www.collinsdictionary.com/us/dictionary/english/' . l:word
"	let l:url = 'https://www.thefreedictionary.com/' . l:word
"	let l:url = 'https://www.merriam-webster.com/dictionary/' . l:word
	" MacOS:
    silent execute '!open ' . shellescape(l:url, 1)
	" Linux:
    "silent execute '!xdg-open ' . shellescape(l:url, 1)
	redraw!
endfunction
nnoremap gy :call OpenDictWithWordUnderCursor()<CR>

" ------------
" --- open Wikipedia.org page for phrase selected in VISUAL mode
" --- <leader>w in VISUAL mode only: 
" note: 
"  viw in NORMAL mode enters VISUAL mode and selects the word under the cursor.
"	* viwe    - add next word to selection,
"	* viwee   - add two more words to selection,
"	* viw3e   - add 3 more words to selection,
"	* v3iw    - select two words
"	* viwob   - adds prev word to selection
"	    - o   - changes selection direction in VISUAL mode
"  vaw  - do not use - selects the word INCLUDING SURROUNDING WHITESPACE!
" Other useful VISUAL commands:
"	- diw   - delete the word 
"	- ciw   - change the word.
"	- viwgU - change word to uppercase
"	- gvy   - reselect (and yank) last VISUAL selection
" For case-sensitive word selection, "viw" selects the word based on word boundaries defined by the "iskeyword" option, while "vaw" includes whitespace around the word.

" test: English Phonology
function! OpenInWikipedia()
	" visual selection is not stored in "v" register in VIM (NeoVim?):
	" using default registry '"' instead!
	"let l:selection = getreg('v')
	"let l:selection = getreg('+')
	let l:selection = getreg('"')
	" replace any spaces with "%20"
	let l:escaped = substitute(l:selection, ' ', '%20', 'g')
	" replace any spaces with underscore "_"
	"let l:escaped = substitute(l:selection, ' ', '_', 'g')
	let l:url = 'https://en.wikipedia.org/wiki/' . l:escaped
	" !open (on macOS) or !xdg-open (on Linux)
	silent execute '!open ' . shellescape(l:url, 1)
	"uncommet to test:
	"execute '!echo ' . shellescape(l:url, 1)
	"silent execute '!xdg-open ' . shellescape(l:url, 1)
	redraw!
endfunction
"xnoremap <leader>w :call OpenInWikipedia()<CR>
" y to yank to default registry; then call function
xnoremap <leader>w y :call OpenInWikipedia()<CR>
