" ------------
" detect OS and set shell:
if has('unix')
	" Linux:
	set shell=/usr/bin/bash
elseif has('mac')
	" MacOS:
	set shell=/bin/zsh
elseif has('win32')
	" Windows (gitbash):
	set shell=/usr/bin/bash
endif
" ------------
" --- open link under cursor in the default web browser
" --- shorcut key: gx - in NORMAL mode only
"
" * on macOS: if "gx" doesn't work,
"   then setting `let g:netrw_browsex_viewer="open"` may fix the issue, 
"   and if it doesn't work, then use one of the following snippets:
" ver 1:
" nnoremap <silent> gx :execute 'silent! !xdg-open ' . shellescape(expand('<cWORD>'), 1)<cr>
" ver 2:
function! OpenURLUnderCursor()
	"let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;()]*')
	" with the cursor on "www" on a link, see below:
	" https://www.website.com
	"          ^
	"          - <cWORD> will return whole link between spaces 
	"          - <cword> will return "www" only (between punctuation marks)
	let s:url = expand('<cWORD>')
	"let s:url = substitute(s:url, '\?', '\\?', '')
	if s:url != ''
		if has('unix')
			" Linux:
			"exec 'silent! !firefox --private-window "https://neilraiden.com/"' - works
			"exec 'silent! !firefox --private-window "' . escape(s:url, '%#!') . '"'
			exec 'silent! !firefox --private-window "' . shellescape(s:url, 1) . '"'
			"silent exec "!xdg-open '".escape(s:url, '%#!')."'"
			"silent exec "!gnome-open '".escape(s:url, '%#!')."'"
			" debug:
			"redir >> @", | exec "!xdg-open '" . escape(s:url, '%#!') . "'" | redir END 
			"redir > output.log | exec "!xdg-open '" . escape(s:url, '%#!') . "'" | redir END
		elseif has('mac')
			" MacOS:
			silent exec "!open '".escape(s:url, '%#!')."'"
		elseif (has('win32') || has('win64'))
			" Windows (GitBash):
			silent exec "!start '".escape(s:url, '%#!')."'"
		endif
		redraw!
	else
		echo "No URL under cursor!"
	endif
endfunction
nnoremap gx :call OpenURLUnderCursor()<CR>
" test:
" place cursor on the link and press "gx":
" https://www.tfd.com

" ------------
" --- open Web Dictionary with word under cursor
" --- shortcut key: gy  - in NORMAL mode only
function! OpenDictWithWordUnderCursor()
    let l:word = expand('<cword>')
	let l:url = 'https://www.collinsdictionary.com/us/dictionary/english/' . l:word
	"let l:url = 'https://www.thefreedictionary.com/' . l:word
	"let l:url = 'https://www.merriam-webster.com/dictionary/' . l:word
	"let l:url = shellescape(l:url, 1)
	if has('unix')
		" Linux:
		"silent execute '!xdg-open ' . l:url   " works but outputs to the screen, messy!
		exec '!firefox --private-window "' . escape(l:url, '%#!') . '"'
	elseif has('mac')
		" MacOS:
		silent execute '!open ' . escape(l:url, '%#!')
	elseif (has('win32') || has('win64'))
		" Windows (GitBash):
		silent exec '!start ' . escape(l:url, '%#!')
	endif
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

" --- shortcut key: <leader>w - in VISUAL mode only 
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
	" open URL:
	if has('unix')
		"Linux:
		:echom escape(l:url, '%#!')
		"silent execute '!xdg-open "' . escape(l:url, '%#!') . '"'
		silent exec '!firefox --private-window "' . escape(l:url, '%#!') . '"'
	elseif has('mac')
		" macOS:
		"silent execute '!open ' . shellescape(l:url, 1)
		silent execute '!open "' . escape(l:url, '%#!') . '"'
		"silent exec '!firefox --private-window "' . escape(l:url, '%#!') . '"'
	elseif (has('win32') || has('win64'))
		" Windows (GitBash):
		silent exec '!start ' . escape(l:url, '%#!')
		"silent execute '!start "' . escape(l:url, '%#!') . '"'
		"silent exec '!firefox --private-window "' . escape(l:url, '%#!') . '"'
	endif
	redraw!
endfunction
"xnoremap <leader>w :call OpenInWikipedia()<CR>
xnoremap <leader>w y :call OpenInWikipedia()<CR>
"   y to yank to default registry; then call function
" test: English Phonology
" test: German Phonology

