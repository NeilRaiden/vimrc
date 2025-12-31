
" The command 
"```
":call popup_atcursor(system("dict hello"), {'pos': 'topleft'}) 
"```
" already gets us somewhere. 
" There's still one problem though: this is static (doesn't change depending on the word) and it's displayed in a single line.

" function DictPopup(word) - inside function refer to param as a:word

function DictPopup()
    let l:word = expand('<cword>')
	"call popup_atcursor(split(system("dict " . a:word), '\n'), {'pos': 'topleft'})
    "call popup_atcursor(split(system("$HOME/.bin/dict " . l:word), '\n'), {'pos': 'topleft'})
    call popup_atcursor(split(system("$HOME/KRL/krl -e " . l:word), '\n'), {'pos': 'topleft'})
endfunction

"command -nargs=1 DictPopup call DictPopup(<f-args>)
"set keywordprg=:DictPopup

function ShavianPopup()
    let l:word = expand('<cword>')
    call popup_atcursor(split(system("$HOME/KRL/krl -s " . l:word), '\n'), {'pos': 'topleft'})
endfunction

nnoremap <leader>h :silent call ShavianPopup()<cr>
nnoremap <leader>d :silent call DictPopup()<cr>

" test : .config acme use
" demeanor test word England English english - this is it, it works.
