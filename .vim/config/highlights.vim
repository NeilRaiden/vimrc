" ------------ color definitions for statusline
" 1st pair
hi User1 ctermfg=Black      ctermbg=LightGreen cterm=bold gui=bold
hi User2 ctermfg=LightGreen ctermbg=Black      cterm=bold gui=bold
" 2nd pair
hi User3 ctermfg=LightGrey  ctermbg=Black      cterm=bold gui=bold
hi User4 ctermfg=Black      ctermbg=LightGrey  cterm=bold gui=bold
" 3rd pair
hi User5 ctermfg=LightBlue  ctermbg=Black      cterm=bold gui=bold
hi User6 ctermfg=Black      ctermbg=LightBlue  cterm=bold gui=bold
hi User7 ctermfg=Red        ctermbg=LightBlue  cterm=bold gui=bold
" unused:
hi User8 ctermfg=Black      ctermbg=LightGreen cterm=bold gui=bold
hi User9 ctermfg=Black      ctermbg=LightGrey  cterm=bold gui=bold
hi User0 ctermfg=Black      ctermbg=LightRed   cterm=bold gui=bold
" ------------ color definitions end

" ------------ statusline start
" simple statusline:
" set statusline=%F[%L][%{&ff}]%y[%04l,%04v]
" nice statusline:
hi StatusLine   cterm=bold
hi StatusLineNC cterm=bold

" ------------ spell check colors
"hi clear SpellBad
hi SpellBad   cterm=bold,underline ctermfg=Magenta guifg=#ff5f5f
"hi SpellBad  cterm=underline      ctermfg=Red ctermbg=LightGray guifg=#ff5f5f guibg=#000000   " misspelled words
hi SpellLocal cterm=bold,underline ctermfg=203 ctermbg=LightGray guifg=#ff5f5f guibg=#000000   " local (eg: color vs colour ; US vs UK)
hi SpellRare  cterm=bold,underline ctermfg=203 ctermbg=LightGray guifg=#ff5f5f guibg=#000000   " rare words
hi SpellCap   cterm=bold,underline ctermfg=203 ctermbg=LightCyan guifg=#ff5f5f guibg=#000000   " not capitalized after '. '. like this

" --- set style for term vim
"hi SpellBad cterm=underline
" --- set style for gVim
"hi SpellBad gui=undercurl
" --- disable capitalization errors:
hi clear SpellCap 

" ------------ make Shavian bold
" highlight Unicode cterm=bold
" match Unicode "[^\xF0-\xFF]"
" highlight Shavian cterm=bold ctermfg=white guifg=white " bold doesn't work because the font is not bold
"highlight Shavian ctermfg=white guifg=white
highlight Shavian ctermfg=LightMagenta guifg=white
match Shavian "[𐑐-𐑿]"
" ------------ 
