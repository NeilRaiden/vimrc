"c--------- Keybaord Layouts Menu
" very simple popup. Press ESC to close it without a selection.
" to check if VIM was compiled with the +popupwin feature:
" :echo has('popupwin')

" --------- todo
" 1. a function to add common inorempa
"    - auto brackets ?
"    - Excel-like time+date ?
"    - what else ?
" 2. add spell checks to:
"   a. en_us+US phonemic
"   b. en_gb+UK_phonemic
"   c. en_us+hsavian_us
"   d. en-gb+shavian_uk

" ------ TOC:
" tags (use <shift+8> to jump between TOC and section:
" popup_menu_colors       - highlights settings
" function_SelectLayout   - function to switch between layouts
"   function_LayoutWriter     - typing common punctuation marks
"   function_LayoutESL        - English phonemes in L2 and L3
"   function_LayoutUSphonemic - US English phonemic (L1 & L2)
"   function_LayoutUKphonemic - UK English phonemic (L1 & L2)
"   function_LayoutUKrhotic   - UK English rhotic (L1 & L2)
"   function_LayoutShavian    - Shavian QWERTY
"   function_LayoutFrames     - drawing frames
"   function_LayoutASERTH     - ASERTH layout
"   function_LayoutColemakDH  - Colemak-DH layout
"   function_LayoutDvorak     - Dvorak layout
"   function_LayoutRussian    - Russian layout (aka: "ЙЦУКЕН")
"   function_LayoutGerman     - German layout
"   function_LayoutDefault    - reset to the "default" VIM layout
" function_CommonImaps        - common imaps (jk for ESC, M+BS for C-W, timestamps, etc)
" function_PopupLayouts       - display layout selector pup-up window

" ------ popup_menu_colors:
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

" ------ functions:
" --- function_SelectLayout

function! SelectLayout(id, result)

    " 'Writer',
    if a:result == 1
		"let g:cheatsheet_file = expand('~/.vim/layouts/writer.md')
		nnoremap <leader>c :65vsp ~/.vim/layouts/writer.md<cr>
		call LayoutWriter()
		call CommonImaps()
    endif

    " 'ESL',
    if a:result == 2
		"let g:cheatsheet_file = expand('~/.vim/layouts/ESL.md')
		nnoremap <leader>c :65vsp ~/.vim/layouts/ESL.md<cr>
		call LayoutESL()
		call CommonImaps()
    endif

    " 'US phonemic',
    if a:result == 3
		"let g:cheatsheet_file = expand('~/.vim/layouts/USphonemic.md')
		nnoremap <leader>c :65vsp ~/.vim/layouts/USphonemic.md<cr>
		call LayoutUSphonemic()
		call CommonImaps()
    endif

    " 'UK phonemic',
    if a:result == 4
		"let g:cheatsheet_file = expand('~/.vim/layouts/UKphonemic.md')
		nnoremap <leader>c :65vsp ~/.vim/layouts/UKphonemic.md<cr>
		call LayoutUKphonemic()
		call CommonImaps()
    endif

    " 'UK rhotic',
    if a:result == 5
		"let g:cheatsheet_file = expand('~/.vim/layouts/UKphonemic.md')
		nnoremap <leader>c :65vsp ~/.vim/layouts/UKrhotic.md<cr>
		call LayoutUKrhotic()
		call CommonImaps()
    endif

    " 'Shavian',
    if a:result == 6
		"let g:cheatsheet_file = expand('~/.vim/layouts/shavian.md')
		nnoremap <leader>c :65vsp ~/.vim/layouts/shavian.md<cr>
		call LayoutShavian()
		call CommonImaps()
    endif

	" 'Frames',
    if a:result == 7
		"let g:cheatsheet_file = expand('~/.vim/layouts/frames.md')
		nnoremap <leader>c :65vsp ~/.vim/layouts/frames.md<cr>
		call LayoutFrames()
		call CommonImaps()
    endif

    " 'ASERTH',
    if a:result == 8
		nnoremap <leader>c :65vsp ~/.vim/layouts/aserth.md<cr>
		call LayoutASERTH()
		call CommonImaps()
    endif

	" 'Colemak-DH',
    if a:result == 9
		nnoremap <leader>c :65vsp ~/.vim/layouts/colemakdh.md<cr>
		call LayoutColemakDH()
		call CommonImaps()
    endif

	" 'Dvorak',
    if a:result == 10
		nnoremap <leader>c :65vsp ~/.vim/layouts/dvorak.md<cr>
		call LayoutDvorak()
		call CommonImaps()
    endif

	" 'Russian',
	"let g:layout = "ЙЦУКЕН"
    if a:result == 11
		nnoremap <leader>c :65vsp ~/.vim/layouts/russian.md<cr>
		call LayoutRussian()
		call CommonImaps()
    endif

	" 'German',
    if a:result == 12
		nnoremap <leader>c :65vsp ~/.vim/layouts/german.md<cr>
		call LayoutGerman()
		call CommonImaps()
    endif

	" 'Default',
    if a:result == 13
		"let g:cheatsheet_file = expand('~/.vim/layouts/readme.md')
		"nnoremap <leader>c :65vsp ~/.vim/cheatsheet.md<cr>
		"nnoremap <leader>c :65vsp ~/.vim/layouts/readme.md<cr>
		nnoremap <leader>c :65vsp ~/.vim/layouts/default.md<cr>
		call LayoutDefault()
		call CommonImaps()
    endif
endfunction

" --------- Layout functions
" --- function_LayoutWriter
function! LayoutWriter()
	let g:layout = "Writer"
	imapclear

	"> Note 1: Layer 1 & 2 inherited from the system layout.
	"> Note 2: (Windows/Linux) AltGr = RightAlt or Alt+Ctrl

	"# Layer 3 (macOS: Option) (Win/Linux: AltGr)
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ´ │ ¹ │ ² │ ³ │ ⁴ │ ⁵ │ ⁶ │ ⁷ │ ⁸ │ ⁹ │ ⁰ │ → │ ≠ │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ … │ ◌̀ │ ◌́ │ ® │ ™ │ √ │ ↑ │ ◌̈ │ ø │ ℗ │ ⟨ │ ⟩ │ •  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ “ │ ” │ ↓ │ ° │ æ │ ‐ │ œ │ « │ » │ § │ × │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ ‘ │ ’ │ © │ ⁃ │ · │ – │ — │ ‹ │ › │ ÷ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	"## combining diacritics:
	"- ⌥w : ◌̀ (U+0300) combining grave accent /ɡreɪv/ or /ɡrɑːv/
	"- ⌥e : ◌́ (U+0301) combining acute accent
	"- ⌥u : ◌̈ (U+0308) combining diaeresis/umlaut (eg: naïve)
	"## hyphens and dashes:
	"- ⌥h : ‐ (U+2010) hyphen
	"- ⌥v : ⁃ (U+2043) bullet hyphen
	"- ⌥n : – (U+2013) N-dash
	"- ⌥m : — (U+2014) M-dash

	" --------- Layer 3: Option/AltGr + Key ---------
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ´ │ ¹ │ ² │ ³ │ ⁴ │ ⁵ │ ⁶ │ ⁷ │ ⁸ │ ⁹ │ ⁰ │ → │ ≠ │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-`> ´
	inoremap <M-1> ¹
	inoremap <M-2> ²
	inoremap <M-3> ³
	inoremap <M-4> ⁴
	inoremap <M-5> ⁵
	inoremap <M-6> ⁶
	inoremap <M-7> ⁷
	inoremap <M-8> ⁸
	inoremap <M-9> ⁹
	inoremap <M-0> ⁰
	inoremap <M--> →
	inoremap <M-=> ≠

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ … │ ◌̀ │ ◌́ │ ® │ ™ │ √ │ ↑ │ ◌̈ │ ø │ ℗ │ ⟨ │ ⟩ │ •  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	"- <M-w> ◌̀ (U+0300) combining grave accent /ɡreɪv/ or /ɡrɑːv/
	"- <M-e> ◌́ (U+0301) combining acute accent
	"- <M-i> ◌̈ (U+0308) combining diaeresis/umlaut (eg: naïve)
	inoremap <M-q> …
	inoremap <M-w> ̀
	inoremap <M-e> ́
	inoremap <M-r> ®
	inoremap <M-t> ™
	inoremap <M-y> √
	inoremap <M-u> ↑
	inoremap <M-i> ̈
	inoremap <M-o> ø
	inoremap <M-p> ℗
	inoremap <M-[> ⟨
	inoremap <M-]> ⟩
	inoremap <M-\> •

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ “ │ ” │ ↓ │ ° │ æ │ ‐ │ œ │ « │ » │ § │ × │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-a> “
	inoremap <M-s> ”
	inoremap <M-d> ↓
	inoremap <M-f> °
	inoremap <M-g> æ
	inoremap <M-h> ‐
	inoremap <M-j> œ
	inoremap <M-k> «
	inoremap <M-l> »
	inoremap <M-;> §
	inoremap <M-'> ×

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ ‘ │ ’ │ © │ ⁃ │ · │ – │ — │ ‹ │ › │ ÷ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	inoremap <M-z> ‘
	inoremap <M-x> ’
	inoremap <M-c> ©
	inoremap <M-v> ⁃
	inoremap <M-b> ·
	inoremap <M-n> –
	inoremap <M-m> —
	inoremap <M-,> ‹
	inoremap <M-.> ›
	inoremap <M-/> ÷

	"# Layer 4 (macOS: Option+Shift) (Win/Linux: AltGr+Shift)
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ≈ │ ₁ │ ₂ │ ₃ │ ₄ │ ₅ │ ₆ │ ₇ │ ₈ │ ₉ │ ₀ │ ← │ ± │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ ⌜ │ ⌝ │ ⌞ │ ⌟ │ ‰ │   │   │   │ Ø │ π │ ⟮ │ ⟯ │ ◦  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │  │ ☺ │   │   │ Æ │ ‑ │ Œ │   │ ₤ │   │   │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ ⌥ │ ⌘ │ ¢ │ ⌃ │ ○ │ ◌̃ │ µ │ ☒ │ ☐ │ ☑ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	" <M-N> ◌̃ (U+0303) combining tilde /ˈtɪldə/ (eg: bueños)˜
	" <M-H> ‑ (U+2011) non-breaking hyphen

	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ≈ │ ₁ │ ₂ │ ₃ │ ₄ │ ₅ │ ₆ │ ₇ │ ₈ │ ₉ │ ₀ │ ← │ ± │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-~> ≈
	inoremap <M-!> ₁
	inoremap <M-@> ₂
	inoremap <M-#> ₃
	inoremap <M-$> ₄
	inoremap <M-%> ₅
	inoremap <M-^> ₆
	inoremap <M-&> ₇
	inoremap <M-*> ₈
	inoremap <M-(> ₉
	inoremap <M-)> ₀
	inoremap <M-_> ←
	inoremap <M-+> ±

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ ⌜ │ ⌝ │ ⌞ │ ⌟ │ ‰ │   │   │   │ Ø │ π │ ⟮ │ ⟯ │ ◦  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap <M-Q> ⌜
	inoremap <M-W> ⌝
	inoremap <M-E> ⌞
	inoremap <M-R> ⌟
	inoremap <M-T> ‰
	inoremap <M-Y>
	inoremap <M-U>
	inoremap <M-I>
	inoremap <M-O> Ø
	inoremap <M-P> π
	inoremap <M-{> ⟮
	inoremap <M-}> ⟯
	inoremap <M-\|> ◦

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │  │ ☺ │   │   │ Æ │ ‑ │ Œ │   │ ₤ │   │   │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	" <M-H> ‑ (U+2011) non-breaking hyphen
	inoremap <M-A> 
	inoremap <M-S> ☺
	inoremap <M-D>
	inoremap <M-F>
	inoremap <M-G> Æ
	inoremap <M-H> ‑
	inoremap <M-J> Œ
	inoremap <M-K>
	inoremap <M-L> ₤
	inoremap <M-:>
	inoremap <M-">

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ ⌥ │ ⌘ │ ¢ │ ⌃ │ ○ │ ◌̃ │ µ │ ☒ │ ☐ │ ☑ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	" <M-N> ◌̃ (U+0303) combining tilde /ˈtɪldə/
	inoremap <M-Z> ⌥
	inoremap <M-X> ⌘
	inoremap <M-C> ¢
	inoremap <M-V> ⌃
	inoremap <M-B> ○
	inoremap <M-N> ̃
	inoremap <M-M> µ
	inoremap <M-<> ☒
	inoremap <M->> ☐
	inoremap <M-?> ☑
endfunction

" --- function_LayoutESL
function! LayoutESL()
	let g:layout = "ESL"
	imapclear

	"> Note: Layer 1 & 2 inherited from the system layout.

	" Layer 3 : macOS: Option - Win/Linux: RightAlt:
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ´ │ ¹ │ ² │ ³ │ ⁴ │ ⁵ │ ⁶ │ ⁷ │ ⁸ │ ⁹ │ ⁰ │ → │ ≠ │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ ɜ │ ʍ │ ɛ │ ɹ │ θ │ ə │ ʊ │ ɪ │ ɔ │ ɒ │ ⟨ │ ⟩ │ •  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ ɑ │ ʃ │ ð │ ɐ │ ɡ │ ‐ │ ʤ │ ʰ │ ɫ │ ː │ ᵊ │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ ʒ │ æ │ ʧ │ ʌ │ · │ ŋ │ ◌̄ │ ˈ │ ˌ │ ʔ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	" Alt+h (⌥h) = ‐ (U+2010) hyphen
	" Alt+m (⌥m) = ◌̃ (U+0303) combining tilde /ˈtɪldə/
	" Alt+, (⌥,) = ˈ (U+02c8) - accent mark primary
	" Alt+. (⌥.) = ˌ (U+02cc) - accent mark secondary

	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ´ │ ¹ │ ² │ ³ │ ⁴ │ ⁵ │ ⁶ │ ⁷ │ ⁸ │ ⁹ │ ⁰ │ → │ ≠ │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-`> ´
	inoremap <M-1> ¹
	inoremap <M-2> ²
	inoremap <M-3> ³
	inoremap <M-4> ⁴
	inoremap <M-5> ⁵
	inoremap <M-6> ⁶
	inoremap <M-7> ⁷
	inoremap <M-8> ⁸
	inoremap <M-9> ⁹
	inoremap <M-0> ⁰
	inoremap <M--> →
	inoremap <M-=> ≠

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ ɜ │ ʍ │ ɛ │ ɹ │ θ │ ə │ ʊ │ ɪ │ ɔ │ ɒ │ ⟨ │ ⟩ │ •  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap <M-q> ɜ
	inoremap <M-w> ʍ
	inoremap <M-e> ɛ
	inoremap <M-r> ɹ
	inoremap <M-t> θ
	inoremap <M-y> ə
	inoremap <M-u> ʊ
	inoremap <M-i> ɪ
	inoremap <M-o> ɔ
	inoremap <M-p> ɒ
	inoremap <M-[> ⟨
	inoremap <M-]> ⟩
	inoremap <M-\> •

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ ɑ │ ʃ │ ð │ ɐ │ ɡ │ ‐ │ ʤ │ ʰ │ ɫ │ ː │ ᵊ │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	" Alt+h (⌥h) ‐ (U+2010) hyphen
	inoremap <M-a> ɑ
	inoremap <M-s> ʃ
	inoremap <M-d> ð
	inoremap <M-f> ɐ
	inoremap <M-g> ɡ
	inoremap <M-h> ‐
	inoremap <M-j> ʤ
	inoremap <M-k> ʰ
	inoremap <M-l> ɫ
	inoremap <M-;> ː
	inoremap <M-'> ᵊ

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ ʒ │ æ │ ʧ │ ʌ │ · │ ŋ │ ◌̃ │ ˈ │ ˌ │ ʔ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	" Alt+m (⌥m) = ◌̃ (U+0303) - combining tilde /ˈtɪldə/
	" Alt+, (⌥,) = ˈ (U+02c8) - accent mark primary
	" Alt+. (⌥.) = ˌ (U+02cc) - accent mark secondary
	" Alt+/ (⌥/) = ʔ (U+0294) - glottal stop
	inoremap <M-z> ʒ
	inoremap <M-x> æ
	inoremap <M-c> ʧ
	inoremap <M-v> ʌ
	inoremap <M-b> ·
	inoremap <M-n> ŋ
	inoremap <M-m> ̃
	inoremap <M-,> ˈ
	inoremap <M-.> ˌ
	inoremap <M-/> ʔ

	"# Layer 4 - AltGr+Shift (RightAlt+Shift or Alt+Ctrl+Shift):
	" ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	" │ ≈ │ ₁ │ ₂ │ ₃ │ ₄ │ ₅ │ ₆ │ ₇ │ ₈ │ ₉ │ ₀ │ ← │ ± │ bksp │
	" ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	" │ tab │ ɝ │ ◌̀ │ ◌́ │ ʳ │ ɾ │ ɚ │ ↑ │   │   │   │ ⟮ │ ⟯ │ ◦  │
	" ├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	" │ caps  │ “ │ ” │ ↓ │ ◌̄ │ ◌̱ │ ‑ │   │ « │ » │ § │ × │  ent │
	" ├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	" │ shift   │ ‘ │ ’ │ … │ ⁃ │ ○ │ – │ — │ ‹ │ › │ ÷ │  shift │
	" └─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	" Alt+W (⌥⇧w) = ◌̀ (U+0300) combining grave accent /ɡreɪv/ or /ɡrɑːv/
	" Alt+E (⌥⇧e) = ◌́ (U+0301) combining acute accent
	" Alt+F (⌥⇧f) = ◌̄ (U+0304) combining macron /ˈmækrɒn/
	" Alt+G (⌥⇧g) = ◌̱ (U+0331) combining macron below
	"## hyphens and dashes:
	" Alt+H (⌥⇧h) = ‑ (U+2011) non-breaking hyphen
	" Alt+V (⌥⇧v) = ⁃ (U+2043) bullet hyphen
	" Alt+N (⌥⇧n) = – (U+2013) N-dash
	" Alt+M (⌥⇧m) = — (U+2014) M-dash

	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ≈ │ ₁ │ ₂ │ ₃ │ ₄ │ ₅ │ ₆ │ ₇ │ ₈ │ ₉ │ ₀ │ ← │ ± │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-~> ≈
	inoremap <M-!> ₁
	inoremap <M-@> ₂
	inoremap <M-#> ₃
	inoremap <M-$> ₄
	inoremap <M-%> ₅
	inoremap <M-^> ₆
	inoremap <M-&> ₇
	inoremap <M-*> ₈
	inoremap <M-(> ₉
	inoremap <M-)> ₀
	inoremap <M-_> ←
	inoremap <M-+> ±

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ ɝ │ ◌̀ │ ◌́ │ ʳ │ ɾ │ ɚ │ ↑ │   │   │   │ ⟮ │ ⟯ │ ◦  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	" Alt+W (⌥⇧w) = ◌̀ (U+0300) combining grave accent /ɡreɪv/ or /ɡrɑːv/
	" Alt+E (⌥⇧e) = ◌́ (U+0301) combining acute accent
	inoremap <M-Q> ɝ
	inoremap <M-W> ̀
	inoremap <M-E> ́
	inoremap <M-R> ʳ
	inoremap <M-T> ɾ
	inoremap <M-Y> ɚ
	inoremap <M-U> ↑
	inoremap <M-I>
	inoremap <M-O>
	inoremap <M-P>
	inoremap <M-{> ⟮
	inoremap <M-}> ⟯
	inoremap <M-\|> ◦

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ “ │ ” │ ↓ │ ◌̄ │ ◌̱ │ ‑ │   │ « │ » │ § │ × │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	" Alt+F (⌥⇧f) = ◌̄ (U+0304) combining macron /ˈmækrɒn/
	" Alt+G (⌥⇧g) = ◌̱ (U+0331) combining macron below
	" Alt+H (⌥⇧h) = ‑ (U+2011) non-breaking hyphen
	inoremap <M-A> “
	inoremap <M-S> ”
	inoremap <M-D> ↓
	inoremap <M-F> ̄
	inoremap <M-G> ̱
	inoremap <M-H> ‑
	inoremap <M-J>
	inoremap <M-K> «
	inoremap <M-L> »
	inoremap <M-:> §
	inoremap <M-"> ×

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ ‘ │ ’ │ … │ ⁃ │ ○ │ – │ — │ ‹ │ › │ ÷ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	" Alt+V (⌥⇧v) = ⁃ (U+2043) bullet hyphen
	" Alt+N (⌥⇧n) = – (U+2013) N-dash
	" Alt+M (⌥⇧m) = — (U+2014) M-dash
	inoremap <M-Z> ‘
	inoremap <M-X> ’
	inoremap <M-C> …
	inoremap <M-V> ⁃
	inoremap <M-B> ○
	inoremap <M-N> –
	inoremap <M-M> —
	inoremap <M-<> ‹
	inoremap <M->> ›
	inoremap <M-?> ÷

endfunction

" --- function_LayoutUSphonemic
function! LayoutUSphonemic()
	let g:layout = "US phonem"
	imapclear

	" Layer 1 (Unshifted):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ` │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ - │ = │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ɔɪ │ w │ ɛ │ r │ t │ ɑ │ ʌ │ ɪ │ ɒ │ p │ [ │ ] │ \  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ ə │ s │ d │ f │ ɡ │ h │ j │ k │ l │ ; │ ' │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ z │ɜr │tʃ │ v │ b │ n │ m │ , │ . │ / │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	" CAPSL row (note: 'g' in IPA is U+0261 not U+67):

	" TAB row:
	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ɔɪ │ w │ ɛ │ r │ t │ ɑ │ ʌ │ ɪ │ ɒ │ p │ [ │ ] │ \  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap q ɔɪ
	"inoremap w w
	inoremap e ɛ
	"inoremap r r
	"inoremap t t
	inoremap y ɑ
	inoremap u ʌ
	inoremap i ɪ
	inoremap o ɒ
	"inoremap p p
	"inoremap [ [
	"inoremap ] ]
	"inoremap \ \

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ ə │ s │ d │ f │ ɡ │ h │ j │ k │ l │ ; │ ' │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap a ə
	"inoremap s s
	"inoremap d d
	"inoremap f f
	inoremap g ɡ
	"inoremap h h
	"inoremap j j
	"inoremap k k
	"inoremap l l

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ z │ɜr │tʃ │ v │ b │ n │ m │ , │ . │ / │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	"inoremap z z
	inoremap x ɜr
	inoremap c tʃ
	"inoremap v v
	"inoremap b b
	"inoremap n n
	"inoremap m m

	" Layer 2 (Shifted):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ~ │ ! │ @ │ # │ $ │ % │ ^ │ & │ * │ ( │ ) │ _ │ + │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │aʊ │ɪə │eɪ │ɑr │ θ │ ɔ │ ʊ │ i │ɔʊ │ɔr │ { │ } │ |  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ æ │ ʃ │ər │aɪ │ · │ ð │dʒ │ « │ » │ : │ " │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ ʒ │er │ɪər│ju │ ⸰ │ ŋ │ u │ ‹ │ › │ ? │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │aʊ │ɪə │eɪ │ɑr │ θ │ ɔ │ ʊ │ i │ɔʊ │ɔr │ ⟨ │ ⟩ │  | │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap Q aʊ
	inoremap W ɪə
	inoremap E eɪ
	inoremap R ɑr
	inoremap T θ
	inoremap Y ɔ
	inoremap U ʊ
	inoremap I i
	inoremap O ɔʊ
	inoremap P ɔr
	"inoremap { {
	"inoremap } }

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ æ │ ʃ │ər │aɪ │ · │ ð │dʒ │ « │ » │ ː │ " │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap A æ
	inoremap S ʃ
	inoremap D ər
	inoremap F aɪ
	inoremap G ·
	inoremap H ð
	inoremap J dʒ
	inoremap K «
	inoremap L »

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ ʒ │er │ɪər│ju │ ⸰ │ ŋ │ u │ ‹ │ › │ ? │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	inoremap Z ʒ
	inoremap X er
	inoremap C ɪər
	inoremap V ju
	inoremap B ⸰
	inoremap N ŋ
	inoremap M u
	inoremap < ‹
	inoremap > ›
	"inoremap ? ?

	" Layer 3 (macOS: Option+key) - (Win/Lin: AltGr + key):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ´ │ ¹ │ ² │ ³ │ ⁴ │ ⁵ │ ⁶ │ ⁷ │ ⁸ │ ⁹ │ ⁰ │ → │ ≠ │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ … │ ʍ │ e │ ʳ │ ɾ │   │ ↑ │   │ ˈ │ ˌ │ ⟨ │ ⟩ │ •  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ “ │ ” │ ↓ │ ° │ ʔ │ ‐ │ ʤ │ ≤ │ ≥ │ ː │ × │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ ‘ │ ’ │ ʧ │ ⁃ │ ○ │ – │ — │ < │ > │ ÷ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ´ │ ¹ │ ² │ ³ │ ⁴ │ ⁵ │ ⁶ │ ⁷ │ ⁸ │ ⁹ │ ⁰ │ → │ ≠ │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-`> ´
	inoremap <M-1> ¹
	inoremap <M-2> ²
	inoremap <M-3> ³
	inoremap <M-4> ⁴
	inoremap <M-5> ⁵
	inoremap <M-6> ⁶
	inoremap <M-7> ⁷
	inoremap <M-8> ⁸
	inoremap <M-9> ⁹
	inoremap <M-0> ⁰
	inoremap <M--> →
	inoremap <M-=> ≠

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ … │ ʍ │ e │ ʳ │ ɾ │   │ ↑ │   │ ˈ │ ˌ │ ⟨ │ ⟩ │ •  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap <M-q> …
	inoremap <M-w> ʍ
	inoremap <M-e> e
	inoremap <M-r> ʳ
	inoremap <M-t> ɾ
	"inoremap <M-y>
	inoremap <M-u> ↑
	"inoremap <M-i>
	inoremap <M-o> ˈ
	inoremap <M-p> ˌ
	inoremap <M-[> ⟨
	inoremap <M-]> ⟩
	inoremap <M-\> •

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ “ │ ” │ ↓ │ ° │ ʔ │ ‐ │ ʤ │ ≤ │ ≥ │ ː │ × │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-a> “
	inoremap <M-s> ”
	inoremap <M-d> ↓
	inoremap <M-f> °
	inoremap <M-g> ʔ
	inoremap <M-h> ‐
	inoremap <M-j> ʤ
	inoremap <M-k> ≤
	inoremap <M-l> ≥
	inoremap <M-;> ː
	inoremap <M-'> ×

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ ‘ │ ’ │ ʧ │ ⁃ │ ○ │ – │ — │ < │ > │ ÷ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	inoremap <M-z> ‘
	inoremap <M-x> ’
	inoremap <M-c> ʧ
	inoremap <M-v> ⁃
	inoremap <M-b> ○
	inoremap <M-n> –
	inoremap <M-m> —
	inoremap <M-,> <
	inoremap <M-.> >
	inoremap <M-/> ÷

	" Opton/AltGr+Space U+2003 Em-space - width equal to font height
	inoremap <M-space>  

	"# Layer 4 (Option/AltGr + Shift + Key):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ≈ │ ₁ │ ₂ │ ₃ │ ₄ │ ₅ │ ₆ │ ₇ │ ₈ │ ₉ │ ₀ │ ← │ ± │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ ⋯ │   │ ɜ │ ɹ │ ʰ │   │   │   │   │   │ ⟮ │ ⟯ │ ◦  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ ɐ │ ☺ │ ɚ │   │ ˀ │ ‑ │   │   │ ɫ │ § │   │  ent │ 
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │   │ ɝ │   │   │ ◌ │   │   │ ☒ │ ☐ │ ☑ │  shift │ 
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ≈ │ ₁ │ ₂ │ ₃ │ ₄ │ ₅ │ ₆ │ ₇ │ ₈ │ ₉ │ ₀ │ ← │ ± │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-~> ≈
	inoremap <M-!> ₁
	inoremap <M-@> ₂
	inoremap <M-#> ₃
	inoremap <M-$> ₄
	inoremap <M-%> ₅
	inoremap <M-^> ₆
	inoremap <M-&> ₇
	inoremap <M-*> ₈
	inoremap <M-(> ₉
	inoremap <M-)> ₀
	inoremap <M-_> ←
	inoremap <M-+> ±

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ ⋯ │   │ ɜ │ ɹ │ ʰ │   │   │   │   │   │ ⟮ │ ⟯ │ ◦  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap <M-Q> ⋯
	"inoremap <M-W>
	inoremap <M-E> ɜ
	inoremap <M-R> ɹ
	inoremap <M-T> ʰ
	"inoremap <M-Y> ə
	"inoremap <M-U> ʊ
	"inoremap <M-I> ˈ
	"inoremap <M-O> ɔ
	"inoremap <M-P> π
	inoremap <M-{> ⟮
	inoremap <M-}> ⟯
	inoremap <M-\|> ◦

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ ɐ │ ☺ │ ɚ │   │ ˀ │ ‑ │   │   │ ɫ │ § │   │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-A> ɐ
	inoremap <M-S> ☺
	inoremap <M-D> ɚ
	"inoremap <M-F>
	inoremap <M-G> ˀ
	inoremap <M-H> ‑
	"inoremap <M-J>
	"inoremap <M-K>
	inoremap <M-L> ɫ
	inoremap <M-:> §
	"inoremap <M-">

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │   │ ɝ │   │   │ ◌ │   │   │ ☒ │ ☐ │ ☑ │  shift │ 
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	"inoremap <M-Z> ʒ
	inoremap <M-X> ɝ
	"inoremap <M-C>
	"inoremap <M-V> ʌ
	inoremap <M-B> ◌
	"inoremap <M-N>
	"inoremap <M-M>
	inoremap <M-<> ☒
	inoremap <M->> ☐
	inoremap <M-?> ☑

	" Option/AltGr + Shift + Space - U+200b - zero-width space
	" macOS: Space and Shift+Space enters U+20, Option+Space or Option+Shift+Space U+A0.
	" so this may not work:
	inoremap <M-S-space> ​

endfunction

" --- function_LayoutUKphonemic
function! LayoutUKphonemic()
	let g:layout = "UK phonem"
	imapclear

	" Layer 1 (Unshifted):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ` │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ - │ = │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ɔɪ │ w │ ɛ │ r │ t │ɑː │ ʌ │ ɪ │ ɒ │ p │ [ │ ] │  \ │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ ə │ s │ d │ f │ ɡ │ h │ j │ k │ l │ ; │ ' │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ z │ɜːʳ│tʃ │ v │ b │ n │ m │ , │ . │ / │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	" NUMBERS row: (the same as on US QWERTY)

	" TAB row:
	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ɔɪ │ w │ ɛ │ r │ t │ɑː │ ʌ │ ɪ │ ɒ │ p │ [ │ ] │  \ │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap q ɔɪ
	"inoremap w w
	inoremap e ɛ
	"inoremap r r
	"inoremap t t
	inoremap y ɑː
	inoremap u ʌ
	inoremap i ɪ
	inoremap o ɒ
	"inoremap p p

	" CAPSL row:
	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ ə │ s │ d │ f │ ɡ │ h │ j │ k │ l │ ; │ ' │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	" (note: 'g' in IPA is U+0261):
	inoremap a ə
	"inoremap s s
	"inoremap d d
	"inoremap f f
	inoremap g ɡ
	"inoremap h h
	"inoremap j j
	"inoremap k k
	"inoremap l l

	"SHIFT row:
	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ z │ɜːʳ│tʃ │ v │ b │ n │ m │ , │ . │ / │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	"inoremap z z
	inoremap x ɜːʳ
	inoremap c tʃ
	"inoremap v v
	"inoremap b b
	"inoremap n n
	"inoremap m m
	"inoremap , ,
	"inoremap . .
	"inoremap / /

	" Layer 2 (Shifted):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ~ │ ! │ @ │ £ │ $ │ % │ ^ │ & │ * │ ( │ ) │ _ │ + │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │aʊ │ɪə │eɪ │ɑːʳ│ θ │ɔː │ ʊ │iː │əʊ │ɔːʳ│ { │ } │ |  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ æ │ ʃ │əʳ │aɪ │ · │ ð │dʒ │ « │ » │ : │ " │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ ʒ │eəʳ│ɪəʳ│juː│ ⸰ │ ŋ │uː │ ‹ │ › │ ? │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	" NUMBERS row:
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ~ │ ! │ @ │ £ │ $ │ % │ ^ │ & │ * │ ( │ ) │ _ │ + │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	"inoremap <S-1> !
	"inoremap <S-2> @
	inoremap <S-3> £
	"inoremap <S-4> $
	"inoremap <S-5> %
	"inoremap <S-6> ^
	"inoremap <S-7> &
	"inoremap <S-8> *
	"inoremap <S-9> (
	"inoremap <S-0> )

	" TAB row:
	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │aʊ │ɪə │eɪ │ɑːʳ│ θ │ɔː │ ʊ │iː │əʊ │ɔːʳ│ { │ } │ |  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap Q aʊ
	inoremap W ɪə
	inoremap E eɪ
	inoremap R ɑːʳ
	inoremap T θ
	inoremap Y ɔː
	inoremap U ʊ
	inoremap I iː
	inoremap O əʊ
	inoremap P ɔːʳ
	"inoremap { {
	"inoremap } }

	" CAPS row:
	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ æ │ ʃ │əʳ │aɪ │ · │ ð │dʒ │ « │ » │ : │ " │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap A æ
	inoremap S ʃ
	inoremap D əʳ
	inoremap F aɪ
	inoremap G ·
	inoremap H ð
	inoremap J dʒ
	inoremap K «
	inoremap L »
	"inoremap : :
	"inoremap " "

	" SHIFT row:
	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ ʒ │eəʳ│ɪəʳ│juː│ ⸰ │ ŋ │uː │ ‹ │ › │ ? │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	inoremap Z ʒ
	inoremap X eəʳ
	inoremap C ɪəʳ
	inoremap V juː
	inoremap B ⸰
	inoremap N ŋ
	inoremap M uː
	inoremap < ‹
	inoremap > ›

	" Layer 3 (Option/AltGr + key):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ´ │ ¹ │ ² │ ³ │ ⁴ │ ⁵ │ ⁶ │ ⁷ │ ⁸ │ ⁹ │ ⁰ │ → │ ≠ │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ … │ ʍ │ e │ ʳ │ ɾ │   │ ↑ │   │ ˈ │ ˌ │ ⟨ │ ⟩ │ •  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ “ │ ” │ ↓ │ ° │ ʔ │ ‐ │ ʤ │ ≤ │ ≥ │ ː │ × │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ ‘ │ ’ │ ʧ │ ⁃ │ ○ │ – │ — │ < │ > │ ÷ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	" NUMBERS row:
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ´ │ ¹ │ ² │ ³ │ ⁴ │ ⁵ │ ⁶ │ ⁷ │ ⁸ │ ⁹ │ ⁰ │ → │ ≠ │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-`> ´
	inoremap <M-1> ¹
	inoremap <M-2> ²
	inoremap <M-3> ³
	inoremap <M-4> ⁴
	inoremap <M-5> ⁵
	inoremap <M-6> ⁶
	inoremap <M-7> ⁷
	inoremap <M-8> ⁸
	inoremap <M-9> ⁹
	inoremap <M-0> ⁰
	inoremap <M--> →
	inoremap <M-=> ≠

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ … │ ʍ │ e │ ʳ │ ɾ │   │ ↑ │   │ ˈ │ ˌ │ ⟨ │ ⟩ │ •  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap <M-q> …
	inoremap <M-w> ʍ
	inoremap <M-e> e
	inoremap <M-r> ʳ
	inoremap <M-t> ɾ
	"inoremap <M-y>
	inoremap <M-u> ↑
	"inoremap <M-i> ɪ
	inoremap <M-o> ˈ
	inoremap <M-p> ˌ
	inoremap <M-[> ⟨
	inoremap <M-]> ⟩
	inoremap <M-\> •

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ “ │ ” │ ↓ │ ° │ ʔ │ ‐ │ ʤ │ ≤ │ ≥ │ ː │ × │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-a> “
	inoremap <M-s> ”
	inoremap <M-d> ↓
	inoremap <M-f> °
	inoremap <M-g> ʔ
	inoremap <M-h> ‐
	inoremap <M-j> ʤ
	inoremap <M-k> ≤
	inoremap <M-l> ≥
	inoremap <M-;> ː
	inoremap <M-'> ×

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ ‘ │ ’ │ ʧ │ ⁃ │ ○ │ – │ — │ < │ > │ ÷ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	inoremap <M-z> ‘
	inoremap <M-x> ’
	inoremap <M-c> ʧ
	inoremap <M-v> ⁃
	inoremap <M-b> ○
	inoremap <M-n> –
	inoremap <M-m> —
	inoremap <M-,> <
	inoremap <M-.> >
	inoremap <M-/> ÷

	" AltGr + Space - U+2003 - Em-space - width equal to font height
	inoremap <M-space>  

	" Layer 4 (Option + Shift + Key)
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ≈ │ ₁ │ ₂ │ ₃ │ ₄ │ ₅ │ ₆ │ ₇ │ ₈ │ ₉ │ ₀ │ ← │ ± │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ ⋯ │   │ ɜ │ ɹ │ ʰ │   │   │   │   │   │ ⟮ │ ⟯ │ ◦  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ ɐ │ ☺ │ ɚ │   │ ˀ │ ‑ │   │   │ ɫ │ § │   │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │   │ ɝ │   │   │ ◌ │   │   │ ☒ │ ☐ │ ☑ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ≈ │ ₁ │ ₂ │ ₃ │ ₄ │ ₅ │ ₆ │ ₇ │ ₈ │ ₉ │ ₀ │ ← │ ± │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-~> ≈
	inoremap <M-!> ₁
	inoremap <M-@> ₂
	inoremap <M-#> ₃
	inoremap <M-$> ₄
	inoremap <M-%> ₅
	inoremap <M-^> ₆
	inoremap <M-&> ₇
	inoremap <M-*> ₈
	inoremap <M-(> ₉
	inoremap <M-)> ₀
	inoremap <M-_> ←
	inoremap <M-+> ±

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ ⋯ │   │ ɜ │ ɹ │ ʰ │   │   │   │   │   │ ⟮ │ ⟯ │ ◦  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap <M-Q> ⋯
	"inoremap <M-W>
	inoremap <M-E> ɜ
	inoremap <M-R> ɹ
	inoremap <M-T> ʰ
	"inoremap <M-Y> 
	"inoremap <M-U> 
	"inoremap <M-I> 
	"inoremap <M-O> 
	"inoremap <M-P> 
	inoremap <M-{> ⟮
	inoremap <M-}> ⟯
	inoremap <M-\|> ◦

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ ɐ │ ☺ │ ɚ │   │ ˀ │ ‑ │   │   │ ɫ │ § │   │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-A> ɐ  
	inoremap <M-S> ☺
	inoremap <M-D> ɚ
	"inoremap <M-F>
	inoremap <M-G> ˀ
	inoremap <M-H> ‑
	"inoremap <M-J> ʧ
	"inoremap <M-K> ˌ
	inoremap <M-L> ɫ
	inoremap <M-:> §
	"inoremap <M-"> ☒

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │   │ ɝ │   │   │ ◌ │   │   │ ☒ │ ☐ │ ☑ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	"inoremap <M-Z>
	inoremap <M-X> ɝ
	"inoremap <M-C>
	"inoremap <M-V>
	inoremap <M-B> ◌
	"inoremap <M-N>
	"inoremap <M-M>
	inoremap <M-<> ☒
	inoremap <M->> ☐
	inoremap <M-?> ☑

	" Option/AltGr +Shift +Space - U+200b - zero-width space:
	inoremap <M-S-space> ​
endfunction

" --- function_LayoutUKrhotic
function! LayoutUKrhotic()
	let g:layout = "UK rhotic"
	imapclear

	" Layer 1 (Unshifted):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ` │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ - │ = │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ɔɪ │ w │ ɛ │ r │ t │ɑː │ ʌ │ ɪ │ ɒ │ p │ [ │ ] │  \ │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ ə │ s │ d │ f │ ɡ │ h │ j │ k │ l │ ; │ ' │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ z │ɜːr│tʃ │ v │ b │ n │ m │ , │ . │ / │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	" --- TAB row:
	inoremap q ɔɪ
	"inoremap w w
	inoremap e ɛ
	"inoremap r r
	"inoremap t t
	inoremap y ɑː
	inoremap u ʌ
	inoremap i ɪ
	inoremap o ɒ
	"inoremap p p

	" --- CAPSL row (note: 'g' in IPA is U+0261):
	inoremap a ə
	"inoremap s s
	"inoremap d d
	"inoremap f f
	inoremap g ɡ
	"inoremap h h
	"inoremap j j
	"inoremap k k
	"inoremap l l

	" --- SHIFT row:
	"inoremap z z
	inoremap x ɜːr
	inoremap c tʃ
	"inoremap v v
	"inoremap b b
	"inoremap n n
	"inoremap m m
	"inoremap , ,
	"inoremap . .
	"inoremap / /

	" Layer 2 (Shifted):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ~ │ ! │ @ │ £ │ $ │ % │ ^ │ & │ * │ ( │ ) │ _ │ + │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │aʊ │ɪə │eɪ │ɑːr│ θ │ɔː │ ʊ │iː │əʊ │ɔːr│ ⟨ │ ⟩ │  | │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ æ │ ʃ │ər │aɪ │ · │ ð │dʒ │ « │ » │ ː │ " │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ ʒ │ɛər│ɪər│juː│ ⸰ │ ŋ │ uː│ ‹ │ › │ ? │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	" --- NUMBERS row:
	"inoremap <S-1> ! !
	"inoremap <S-2> @ @
	inoremap <S-3> £
	"inoremap <S-4> $ $
	"inoremap <S-5> % %
	"inoremap <S-6> ^ ^
	"inoremap <S-7> & &
	"inoremap <S-8> * *
	"inoremap <S-9> ( (
	"inoremap <S-0> ) )

	" --- TAB row:
	inoremap Q aʊ
	inoremap W ɪə
	inoremap E eɪ
	inoremap R ɑːr
	inoremap T θ
	inoremap Y ɔː
	inoremap U ʊ
	inoremap I iː
	inoremap O əʊ
	inoremap P ɔːr
	"inoremap { {
	"inoremap } }

	" --- CAPS row:
	inoremap A æ
	inoremap S ʃ
	inoremap D ər
	inoremap F aɪ
	inoremap G ·
	inoremap H ð
	inoremap J dʒ
	inoremap K «
	inoremap L »
	"inoremap : :

	" --- SHIFT row:
	inoremap Z ʒ
	inoremap X eər
	inoremap C ɪər
	inoremap V juː
	inoremap B ⸰
	inoremap N ŋ
	inoremap M uː
	inoremap < ‹
	inoremap > ›

	" Layer 3 (Option/AltGr + key):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ´ │ ¹ │ ² │ ³ │ ⁴ │ ⁵ │ ⁶ │ ⁷ │ ⁸ │ ⁹ │ ⁰ │ → │ ≠ │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ … │ ʍ │ e │ ʳ │ ɾ │   │ ↑ │   │ ˈ │ ˌ │ ⟨ │ ⟩ │ •  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ “ │ ” │ ↓ │ ° │ ʔ │ ‐ │ ʤ │ ≤ │ ≥ │ ː │ × │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ ‘ │ ’ │ ʧ │ ⁃ │ ○ │ – │ — │ < │ > │ ÷ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	" NUMBERS row:
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ´ │ ¹ │ ² │ ³ │ ⁴ │ ⁵ │ ⁶ │ ⁷ │ ⁸ │ ⁹ │ ⁰ │ → │ ≠ │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-`> ´
	inoremap <M-1> ¹
	inoremap <M-2> ²
	inoremap <M-3> ³
	inoremap <M-4> ⁴
	inoremap <M-5> ⁵
	inoremap <M-6> ⁶
	inoremap <M-7> ⁷
	inoremap <M-8> ⁸
	inoremap <M-9> ⁹
	inoremap <M-0> ⁰
	inoremap <M--> →
	inoremap <M-=> ≠

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ … │ ʍ │ e │ ʳ │ ɾ │   │ ↑ │   │ ˈ │ ˌ │ ⟨ │ ⟩ │ •  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap <M-q> …
	inoremap <M-w> ʍ
	inoremap <M-e> e
	inoremap <M-r> ʳ
	inoremap <M-t> ɾ
	"inoremap <M-y>
	inoremap <M-u> ↑
	"inoremap <M-i> ɪ
	inoremap <M-o> ˈ
	inoremap <M-p> ˌ
	inoremap <M-[> ⟨
	inoremap <M-]> ⟩
	inoremap <M-\> •

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ “ │ ” │ ↓ │ ° │ ʔ │ ‐ │ ʤ │ ≤ │ ≥ │ ː │ × │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-a> “
	inoremap <M-s> ”
	inoremap <M-d> ↓
	inoremap <M-f> °
	inoremap <M-g> ʔ
	inoremap <M-h> ‐
	inoremap <M-j> ʤ
	inoremap <M-k> ≤
	inoremap <M-l> ≥
	inoremap <M-;> ː
	inoremap <M-'> ×

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ ‘ │ ’ │ ʧ │ ⁃ │ ○ │ – │ — │ < │ > │ ÷ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	inoremap <M-z> ‘
	inoremap <M-x> ’
	inoremap <M-c> ʧ
	inoremap <M-v> ⁃
	inoremap <M-b> ○
	inoremap <M-n> –
	inoremap <M-m> —
	inoremap <M-,> <
	inoremap <M-.> >
	inoremap <M-/> ÷

	" AltGr + Space - U+2003 - Em-space - width equal to font height
	inoremap <M-space>  

	" Layer 4 (Option + Shift + Key)
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ≈ │ ₁ │ ₂ │ ₃ │ ₄ │ ₅ │ ₆ │ ₇ │ ₈ │ ₉ │ ₀ │ ← │ ± │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ ⋯ │   │ ɜ │ ɹ │ ʰ │   │   │   │   │   │ ⟮ │ ⟯ │ ◦  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ ɐ │ ☺ │ ɚ │   │ ˀ │ ‑ │   │   │ ɫ │ § │   │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │   │ ɝ │   │   │ ◌ │   │   │ ☒ │ ☐ │ ☑ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ≈ │ ₁ │ ₂ │ ₃ │ ₄ │ ₅ │ ₆ │ ₇ │ ₈ │ ₉ │ ₀ │ ← │ ± │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-~> ≈
	inoremap <M-!> ₁
	inoremap <M-@> ₂
	inoremap <M-#> ₃
	inoremap <M-$> ₄
	inoremap <M-%> ₅
	inoremap <M-^> ₆
	inoremap <M-&> ₇
	inoremap <M-*> ₈
	inoremap <M-(> ₉
	inoremap <M-)> ₀
	inoremap <M-_> ←
	inoremap <M-+> ±

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ ⋯ │   │ ɜ │ ɹ │ ʰ │   │   │   │   │   │ ⟮ │ ⟯ │ ◦  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap <M-Q> ⋯
	"inoremap <M-W>
	inoremap <M-E> ɜ
	inoremap <M-R> ɹ
	inoremap <M-T> ʰ
	"inoremap <M-Y> 
	"inoremap <M-U> 
	"inoremap <M-I> 
	"inoremap <M-O> 
	"inoremap <M-P> 
	inoremap <M-{> ⟮
	inoremap <M-}> ⟯
	inoremap <M-\|> ◦

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ ɐ │ ☺ │ ɚ │   │ ˀ │ ‑ │   │   │ ɫ │ § │   │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap <M-A> ɐ  
	inoremap <M-S> ☺
	inoremap <M-D> ɚ
	"inoremap <M-F>
	inoremap <M-G> ˀ
	inoremap <M-H> ‑
	"inoremap <M-J> ʧ
	"inoremap <M-K> ˌ
	inoremap <M-L> ɫ
	inoremap <M-:> §
	"inoremap <M-"> ☒

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │   │ ɝ │   │   │ ◌ │   │   │ ☒ │ ☐ │ ☑ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	"inoremap <M-Z>
	inoremap <M-X> ɝ
	"inoremap <M-C>
	"inoremap <M-V>
	inoremap <M-B> ◌
	"inoremap <M-N>
	"inoremap <M-M>
	inoremap <M-<> ☒
	inoremap <M->> ☐
	inoremap <M-?> ☑

	" Option/AltGr +Shift +Space - U+200b - zero-width space:
	inoremap <M-S-space> ​

endfunction

" --- function_LayoutShavian
function! LayoutShavian()
	let g:layout = "Shavian"
	imapclear

	"# Layer 1:
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ` │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ - │ = │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ 𐑶 │ 𐑢 │ 𐑧 │ 𐑮 │ 𐑑 │ 𐑭 │ 𐑳 │ 𐑦 │ 𐑪 │ 𐑐 │ [ │ ] │  \ │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ 𐑩 │ 𐑕 │ 𐑛 │ 𐑓 │ 𐑜 │ 𐑣 │ 𐑘 │ 𐑒 │ 𐑤 │ ; │ ' │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ 𐑟 │ 𐑻 │ 𐑗 │ 𐑝 │ 𐑚 │ 𐑯 │ 𐑥 │ , │ . │ / │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	" ┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	" │ tab │ 𐑶 │ 𐑢 │ 𐑧 │ 𐑮 │ 𐑑 │ 𐑭 │ 𐑳 │ 𐑦 │ 𐑪 │ 𐑐 │ [ │ ] │  \ │
	" └─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap q 𐑶
	inoremap w 𐑢
	inoremap e 𐑧
	inoremap r 𐑮
	inoremap t 𐑑
	inoremap y 𐑭
	inoremap u 𐑳
	inoremap i 𐑦
	inoremap o 𐑪
	inoremap p 𐑐

	" ┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	" │ caps  │ 𐑩 │ 𐑕 │ 𐑛 │ 𐑓 │ 𐑜 │ 𐑣 │ 𐑘 │ 𐑒 │ 𐑤 │ ; │ ' │  ent │
	" └───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap a 𐑩
	inoremap s 𐑕
	inoremap d 𐑛
	inoremap f 𐑓
	inoremap g 𐑜
	inoremap h 𐑣
	inoremap j 𐑘
	inoremap k 𐑒
	inoremap l 𐑤

	" ┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	" │ shift   │ 𐑟 │ 𐑻 │ 𐑗 │ 𐑝 │ 𐑚 │ 𐑯 │ 𐑥 │ , │ . │ / │  shift │
	" └─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	inoremap z 𐑟
	inoremap x 𐑻
	inoremap c 𐑗
	inoremap v 𐑝
	inoremap b 𐑚
	inoremap n 𐑯
	inoremap m 𐑥


	"## Layer 2 (shift):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ~ │ ! │ @ │ # │ $ │ % │ ^ │ & │ * │ ( │ ) │ _ │ + │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ 𐑬 │ 𐑾 │ 𐑱 │ 𐑸 │ 𐑔 │ 𐑷 │ 𐑫 │ 𐑰 │ 𐑴 │ 𐑹 │ { │ } │  | │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ 𐑨 │ 𐑖 │ 𐑼 │ 𐑲 │ · │ 𐑞 │ 𐑡 │ « │ » │ : │ " │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ 𐑠 │ 𐑺 │ 𐑽 │ 𐑿 │ ⸰ │ 𐑙 │ 𐑵 │ ‹ │ › │ ? │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	" ┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	" │ tab │ 𐑬 │ 𐑾 │ 𐑱 │ 𐑸 │ 𐑔 │ 𐑷 │ 𐑫 │ 𐑰 │ 𐑴 │ 𐑹 │ { │ } │  | │
	" └─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap Q 𐑬
	inoremap W 𐑾
	inoremap E 𐑱
	inoremap R 𐑸
	inoremap T 𐑔
	inoremap Y 𐑷
	inoremap U 𐑫
	inoremap I 𐑰
	inoremap O 𐑴
	inoremap P 𐑹
	"inoremap { {
	"inoremap } }

	" ┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	" │ caps  │ 𐑨 │ 𐑖 │ 𐑼 │ 𐑲 │ · │ 𐑞 │ 𐑡 │ « │ » │ : │ " │  ent │
	" └───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap A 𐑨
	inoremap S 𐑖
	inoremap D 𐑼
	inoremap F 𐑲
	inoremap G ·
	inoremap H 𐑞
	inoremap J 𐑡
	inoremap K «
	inoremap L »

	" ┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	" │ shift   │ 𐑠 │ 𐑺 │ 𐑽 │ 𐑿 │ ⸰ │ 𐑙 │ 𐑵 │ ‹ │ › │ ? │  shift │
	" └─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	inoremap Z 𐑠
	inoremap X 𐑺
	inoremap C 𐑽
	inoremap V 𐑿
	inoremap B ⸰
	inoremap N 𐑙
	inoremap M 𐑵
	inoremap < ‹
	inoremap > ›

	" todo: for layers 3 and 4 load the same part as in Writer.

endfunction

" ---------
" --- function_LayoutFrames
function! LayoutFrames()
	let g:layout = "Frames"
	imapclear

	" --------- Apple symbols:
	" ⌘ – Command Key symbol
	" ⌥ – Option Key symbol
	" ⌃ – Control Key symbol
	" ⇧ – Shift Key symbol
	" ⇪ – Capslock symbol
	" ␣ - Space
	" ⏎ – Return symbol

	" --------- Row 1: Option + Key ---------
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│  │ ┌ │ ┐ │ └ │ ┘ │ ┬ │ ┴ │ ├ │ ┼ │ ┤ │ │ │ ─ │  │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
		inoremap <M-`> 
		inoremap <M-1> ┌
		inoremap <M-2> ┐
		inoremap <M-3> └
		inoremap <M-4> ┘
		inoremap <M-5> ┬
		inoremap <M-6> ┴
		inoremap <M-7> ├
		inoremap <M-8> ┼
		inoremap <M-9> ┤
		inoremap <M-0> │
		inoremap <M--> ─
		inoremap <M-=> 

	" --------- Row 1: Option + Shift + Key --------- round corners
	"╭───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────╮
	"│ ⌘ │ ╭ │ ╮ │ ╰ │ ╯ │ ⌥ │ ⌃ │ ⇧ │   │ ␣ │ ↵ │   │  │ bksp │
	"╰───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────╯

"¡ À[27;3;35~ ¤ ¥ Þ ¦ ª ¨ © ß «
		inoremap <M-~> ⌘
		inoremap <M-!> ╭
		inoremap <M-@> ╮
		inoremap <M-#> ╰
		inoremap <M-$> ╯
		inoremap <M-%> ⌥
		inoremap <M-^> ⌃
		inoremap <M-&> ⇧
		inoremap <M-*> ⇪
		inoremap <M-(> ␣
		inoremap <M-)> ↵
		inoremap <M-+> 

	" --------- Row 2: Option + Key ---------
	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ ⇥ │   │   │   │   │   │   │   │   │   │   │   │  ⌫ │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	" ⇥ – Tab Key symbol (actually 'rightwards arrow to bar')
	" ⌫ – U+232B - Backspace symbol
		inoremap <M-q> ⇥
		inoremap <M-\> ⌫

	" --------- Row 2: Option + Shift + Key ---------
	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ ⇤ │   │   │   │   │   │   │   │   │   │   │   │ ⌦  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	" ⇤ - U+21E4  - leftwards arrow to bar
	" ⌦ - U+2326  - Delete symbol
		inoremap <M-S-q> ⇤
		inoremap <M-S-\> ⌦

	" --------- Row 3: Option + Key ---------
	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ ⇪ │   │   │   │   │ ← │ ↓ │ ↑ │ → │   │ ⏎ │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	" ⇪ – Capslock symbol
	" ⏎ – Return symbol
		inoremap <M-a> ⇪
		inoremap <M-h> ←
		inoremap <M-j> ↓
		inoremap <M-k> ↑
		inoremap <M-l> →
		inoremap <M-'> ⏎

	" --------- Row 3: Option + Shift + Key ---------
	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ ⎋ │   │   │   │   │ ◀ │ ▼ │ ▲ │ ▶ │   │ ↵ │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	" ⎋ – ESC Key symbol
		inoremap <M-A> ⎋
		inoremap <M-H> ◀
		inoremap <M-J> ▼
		inoremap <M-K> ▲
		inoremap <M-L> ▶
		inoremap <M-"> ↵

	" --------- Row 4: Option + Key ---------
	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ ⇧ │ ⌘ │   │   │   │   │   │   │   │   │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	" ⇧ – Shift Key symbol
	" ⌘ – Command Key symbol
	" ␣ - Space
		inoremap <M-z> ⇪
		inoremap <M-x> ⌘
		inoremap <M-space> ␣
endfunction

" --- function_LayoutASERTH
function! LayoutASERTH()
	let g:layout = "ASERTH"
    imapclear

	" ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	" │ ` │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ - │ = │ bksp │
	" ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	" │ tab │   │   │ d │ f │ g │   │   │ k │ p │ ; │   │   │    │
	" ├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	" │ caps  │   │   │ e │ r │ t │   │ n │ i │ o │ l │   │  ent │
	" ├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	" │ shift   │   │   │   │   │   │ j │   │   │   │   │  shift │
	" └─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	" --------- lowercase (unshifted) ---------
	" 1. flip keys ⟮ert⟯ with ⟮dfg⟯
	inoremap e d
	inoremap d e
	inoremap r f
	inoremap f r
	inoremap t g
	inoremap g t
	" 2. flip ⟮n⟯ with ⟮j⟯
	inoremap n j
	inoremap j n
	" 3. flip ⟮k⟯ with ⟮i⟯
	inoremap i k
	inoremap k i
	" 4. twist or rotate (counter-clockwise): ⟮l → ; → p → o → l⟯
	inoremap l o
	inoremap ; l
	inoremap p ;
	inoremap o p

	" --------- uppercase (shifted) ---------
	" 1. flip keys ⟮ERT⟯ with ⟮DFG⟯
	inoremap E D
	inoremap D E
	inoremap R F
	inoremap F R
	inoremap T G
	inoremap G T
	" 2. flip ⟮N⟯ with ⟮J⟯
	inoremap N J
	inoremap J N
	" 3. flip ⟮K⟯ with ⟮I⟯
	inoremap I K
	inoremap K I
	" 4. twist or rotate (counter-clockwise): ⟮l → ; → p → o → l⟯
	inoremap L O
	inoremap : L
	inoremap P :
	inoremap O P
endfunction

" --- function_LayoutColemakDH
function! LayoutColemakDH()
	let g:layout = "Colemak-DH"
    imapclear

	" Layer 1:
	" ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	" │ ` │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ - │ = │ bksp │
	" ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	" │ tab │ q │ w │ f │ p │ b │ j │ l │ u │ y │ ; │ [ │ ] │  \ │
	" ├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	" │ caps  │ a │ r │ s │ t │ g │ m │ n │ e │ i │ o │ ' │  ent │
	" ├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	" │ shift   │ z │ x │ c │ d │ v │ k │ h │ , │ . │ / │  shift │
	" └─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	" --- TAB row
	"inoremap q q
	"inoremap w w
	inoremap e f
	inoremap r p
	inoremap t b
	inoremap y j
	inoremap u l
	inoremap i u
	inoremap o y
	inoremap p ;

	" --- CAPS row
	"inoremap a a
	inoremap s r
	inoremap d s
	inoremap f t
	"inoremap g g
	inoremap h m
	inoremap j n
	inoremap k e
	inoremap l i
	inoremap ; o

	" --- SHIFT row
	"inoremap z z
	"inoremap x x
	"inoremap c c
	inoremap v d
	inoremap b v
	inoremap n k
	inoremap m h
	
	" Layer 2:
	" ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	" │ ~ │ ! │ @ │ # │ $ │ % │ ^ │ & │ * │ ( │ ) │ _ │ + │ bksp │
	" ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	" │ tab │ Q │ W │ F │ P │ B │ J │ L │ U │ Y │ : │ { │ } │  | │
	" ├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	" │ caps  │ A │ R │ S │ T │ G │ M │ N │ E │ I │ O │ " │  ent │
	" ├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	" │ shift   │ Z │ X │ C │ D │ V │ K │ H │ < │ > │ ? │  shift │
	" └─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘

	" --- TAB row
	"inoremap Q Q
	"inoremap W W
	inoremap E F
	inoremap R P
	inoremap T B
	inoremap Y J
	inoremap U L
	inoremap I U
	inoremap O Y
	inoremap P :

	" --- CAPS row
	"inoremap A A
	inoremap S R
	inoremap D S
	inoremap F T
	"inoremap G G
	inoremap H M
	inoremap J N
	inoremap K E
	inoremap L I
	inoremap : O

	" --- SHIFT row
	"inoremap Z Z
	"inoremap X X
	"inoremap C C
	inoremap V D
	inoremap B V
	inoremap N K
	inoremap M H
endfunction

" --- function_LayoutDvorak
function! LayoutDvorak()
	let g:layout = "Dvorak"
    imapclear

	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ` │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ - │ = │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap - [
	inoremap = ]

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ ' │ , │ . │ p │ y │ f │ g │ c │ r │ l │ / │ = │  \ │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap q '
	inoremap w ,
	inoremap e .
	inoremap r p
	inoremap t y
	inoremap y f
	inoremap u g
	inoremap i c
	inoremap o r
	inoremap p l
	inoremap [ /
	inoremap ] =

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ a │ o │ e │ u │ i │ d │ h │ t │ n │ s │ - │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap a a
	inoremap s o
	inoremap d e
	inoremap f u
	inoremap g i
	inoremap h d
	inoremap j h
	inoremap k t
	inoremap l n
	inoremap ; s
	inoremap ' -

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ ; │ q │ j │ k │ x │ b │ m │ w │ v │ z │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	inoremap z ;
	inoremap x q
	inoremap c j
	inoremap v k
	inoremap b x
	inoremap n b
	inoremap m m
	inoremap , w
	inoremap . v
	inoremap / z

	" Layer 2 (shifted):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ~ │ ! │ @ │ # │ $ │ % │ ^ │ & │ * │ ( │ ) │ { │ } │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap _ {
	inoremap + }

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ " │ < │ > │ P │ Y │ F │ G │ C │ R │ L │ ? │ + │  | │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap Q "
	inoremap W <
	inoremap E >
	inoremap R P
	inoremap T Y
	inoremap Y F
	inoremap U G
	inoremap I C
	inoremap O R
	inoremap P L
	inoremap { ?
	inoremap } +

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ A │ O │ E │ U │ I │ D │ H │ T │ N │ S │ _ │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap A A
	inoremap S O
	inoremap D E
	inoremap F U
	inoremap G I
	inoremap H D
	inoremap J H
	inoremap K T
	inoremap L N
	inoremap : S
	inoremap ' _

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ : │ Q │ J │ K │ X │ B │ M │ W │ V │ Z │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	inoremap Z :
	inoremap X Q
	inoremap C J
	inoremap V K
	inoremap B X
	inoremap N B
	inoremap M M
	inoremap < W
	inoremap > V
	inoremap ? Z
endfunction

" --- function_LayoutRussian
function! LayoutRussian()
	let g:layout = "ЙЦУКЕН"
    imapclear

	" русская клавиатура: ЙЦУКЕН
	" Layer 1 (unshifted):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ ё │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ - │ = │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap ` ё

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ й │ ц │ у │ к │ е │ н │ г │ ш │ щ │ з │ х │ ъ │ \  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap q й
	inoremap w ц
	inoremap e у
	inoremap r к
	inoremap t е
	inoremap y н
	inoremap u г
	inoremap i ш
	inoremap o щ
	inoremap p з
	inoremap [ х
	inoremap ] ъ
"	inoremap \ \

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ ф │ ы │ в │ а │ п │ р │ о │ л │ д │ ж │ э │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap a ф
	inoremap s ы
	inoremap d в
	inoremap f а
	inoremap g п
	inoremap h р
	inoremap j о
	inoremap k л
	inoremap l д
	inoremap ; ж
	inoremap ' э

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ я │ ч │ с │ м │ и │ т │ ь │ б │ ю │ . │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	inoremap z я
	inoremap x ч
	inoremap c с
	inoremap v м
	inoremap b и
	inoremap n т
	inoremap m ь
	inoremap , б
	inoremap . ю
	inoremap / .

	" Layer 2 (shifted):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ Ё │ ! │ " │ № │ ; │ % │ : │ ? │ * │ ( │ ) │ _ │ + │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	" numbers row:
	inoremap ~ Ё
	inoremap ! !
	inoremap @ "
	inoremap # №
	inoremap $ ;
	inoremap % %
	inoremap ^ :
	inoremap & ?
	"inoremap * *
	"inoremap ( (
	"inoremap ) )
	"inoremap _ _
	"inoremap + +

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ Й │ Ц │ У │ К │ Е │ Н │ Г │ Ш │ Щ │ З │ Х │ Ъ │ /  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap Q Й
	inoremap W Ц
	inoremap E У
	inoremap R К
	inoremap T Е
	inoremap Y Н
	inoremap U Г
	inoremap I Ш
	inoremap O Щ
	inoremap P З
	inoremap { Х
	inoremap } Ъ
	"inoremap <S-\> /
	inoremap <bar> /

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ Ф │ Ы │ В │ А │ П │ Р │ О │ Л │ Д │ Ж │ Э │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap A Ф
	inoremap S Ы
	inoremap D В
	inoremap F А
	inoremap G П
	inoremap H Р
	inoremap J О
	inoremap K Л
	inoremap L Д
	inoremap : Ж
	inoremap " Э

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ Я │ Ч │ С │ М │ И │ Т │ Ь │ Б │ Ю │ , │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	inoremap Z Я
	inoremap X Ч
	inoremap C С
	inoremap V М
	inoremap B И
	inoremap N Т
	inoremap M Ь
	inoremap < Б
	inoremap > Ю
	inoremap ? ,

endfunction

" ---  function_LayoutGerman
function! LayoutGerman()
	let g:layout = "German"
    imapclear

	"# Layer 1 (unshifted):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ < │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ ß │ ó │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ q │ w │ e │ r │ t │ z │ u │ i │ o │ p │ ü │ + │ #  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ a │ s │ d │ f │ g │ h │ j │ k │ l │ ö │ ä │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ y │ x │ c │ v │ b │ n │ m │ , │ . │ - │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	"ö dead key

	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ < │ 1 │ 2 │ 3 │ 4 │ 5 │ 6 │ 7 │ 8 │ 9 │ 0 │ ß │ ó │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	" the =/+ key is a dead key !
	inoremap ` <
	inoremap - ß
	inoremap = ó

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ q │ w │ e │ r │ t │ z │ u │ i │ o │ p │ ü │ + │ #  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap y z
	inoremap [ ü
	inoremap ] +
	inoremap \ #

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ a │ s │ d │ f │ g │ h │ j │ k │ l │ ö │ ä │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap ; ö
	inoremap ' ä

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ y │ x │ c │ v │ b │ n │ m │ , │ . │ - │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	inoremap z y
	inoremap / -

	"# Layer 2 (shift):
	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ > │ ! │ " │ § │ $ │ % │ & │ / │ ( │ ) │ = │ ? │ ò │ bksp │
	"├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
	"│ tab │ Q │ W │ E │ R │ T │ Z │ U │ I │ O │ P │ Ü │ * │ '  │
	"├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
	"│ caps  │ A │ S │ D │ F │ G │ H │ J │ K │ L │ Ö │ Ä │  ent │
	"├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
	"│ shift   │ Y │ X │ C │ V │ B │ N │ M │ ; │ : │ _ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	"ò dead key

	"┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ > │ ! │ " │ § │ $ │ % │ & │ / │ ( │ ) │ = │ ? │ ò │ bksp │
	"└───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	" numbers row:
	inoremap ~ >
	"inoremap ! !
	inoremap @ "
	inoremap # §
	"inoremap $ $
	"inoremap % %
	inoremap ^ &
	inoremap & /
	inoremap * (
	inoremap ( )
	inoremap ) =
	inoremap _ ?
	" todo: finish this (this is a dead key)
	" or better make a Deutsch-ohne-Tottasten layout
	"inoremap + ò

	"┌─────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────┐
	"│ tab │ Q │ W │ E │ R │ T │ Z │ U │ I │ O │ P │ Ü │ * │ '  │
	"└─────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────┘
	inoremap Y Z
	inoremap { Ü
	inoremap } *
	inoremap <bar> '

	"┌───────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
	"│ caps  │ A │ S │ D │ F │ G │ H │ J │ K │ L │ Ö │ Ä │  ent │
	"└───────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴──────┘
	inoremap : Ö
	inoremap " Ä

	"┌─────────┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬────────┐
	"│ shift   │ Y │ X │ C │ V │ B │ N │ M │ ; │ : │ _ │  shift │
	"└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
	inoremap Z Y
	inoremap < ;
	inoremap > :
	inoremap ? _

	" todo: layer 3 and 4

endfunction

" --- function_LayoutDefault
function! LayoutDefault()
	let g:layout = "Default"
    imapclear
endfunction

" --- function_CommonImaps
function! CommonImaps()
	" jk to ESC 
	"inoremap jk <ESC>
	"default timeoutlen=1000 (1000 miliseconds)
	"with tm=150ms the "jk" must be pressed relatively fast
	"set timeoutlen=150

	" Option+BackSpace to delete whole last word:
	inoremap <M-BS> <C-W>
	"cnoremap <M-BS> <C-W>

	" insert date/time/timestamp MS Excell-style:
	inoremap <C-;> <C-r>=strftime('%Y-%m-%d')<CR>
	inoremap <C-'> <C-r>=strftime('%H:%M:%S')<CR>
	inoremap <C-:> <C-r>=strftime('%a, %b %d')<CR>
	inoremap <C-"> <C-r>=strftime('%V')<CR>

	" CTRL-U in INSERT mode deletes a lot.
	" "<Ctrl-G>u" to break undo, so that you can undo "CTRL-U" after inserting a line break.
	"inoremap <C-U> <C-G>u<C-U>
	inoremap <C-u> <C-G>u<C-u>

endfunction

" --- function_PopupLayouts
function! PopupLayouts()
"	let l:ln = winwidth(0)
"	let l:cl = winheight(0)
	let lines = winheight(0)
	let columns = winwidth(0)
  call popup_menu([
    \ 'Writer',
    \ 'ESL',
    \ 'US phonemic',
    \ 'UK phonemic',
    \ 'UK rhotic',
    \ 'Shavian',
	\ 'Frames',
    \ 'ASERTH',
	\ 'Colemak-DH',
	\ 'Dvorak',
	\ 'ЙЦУКЕН',
	\ 'Deutsch',
	\ 'Default',
    \ ], #{
	\ relative: "win",
    \ line: &lines - 2,
    \ col:  &columns,
	\ pos: 'botright',
    \ title: "─ Select layout: ─",
    \ callback: 'SelectLayout',
    \ highlight: 'Question',
	\ borderhighlight: ['TopColor','RightColor','BottomColor','LeftColor'],
    \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
	\ border: [1,1,1,1],
    \ close: 'click',
    \ padding: [1,3,1,3],
    \ })
endfunction

" padding order: [top, right, bottom, left ]
" square border corners:
" \ borderchars: ['─', '│', '─', '│', '┌', '┐', '┘', '└'],

" ------ mapping:
nnoremap <leader><leader><leader> :call PopupLayouts()<CR>
"nnoremap <leader>c :call PopupCheatsheet()<CR>
