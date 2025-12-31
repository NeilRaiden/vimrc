" --------- auto pairing brackets

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
	inoremap kl <ESC>%%a
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
	iunmap kl
endfunction

function! s:TogglePairing()
    if s:PairingsState
		call s:PairingDisable()
    else
		call s:PairingEnable()
    endif
endfunction

nnoremap <leader>( :call <SID>PairingEnable()<cr>
nnoremap <leader>) :call <SID>PairingDisable()<cr>
" --------- end
