# VIM cheatsheet

> Note: this is a very simple cheatsheet.
> - add things you may forget,
> - remove what's obvious and only takes space here.

## TOC
0.  Intro
1.  Moving viewport
2.  Navigation
3.  Jumping
4.  Delete
5.  Find
6.  Buffers
7.  Folding
8.  Splits or Windows or Panes
9.  Marks
10. Macros
11. Incrementing
12. Spelling
13. VISUAL mode
14. INSERT mode
15. Registers
16. Vimgrep
17. Join lines
18. Display non-printable chars 
19. Digraphs
20. VIM help

## Intro:

* ':map <leader>' - list user-defined <leader> shortcuts

## 1. Moving-scrolling viewport

* zz -    place current line in the middle of the screen
* zt -    place current line at the top of the screen
* zb -    place current line at the bottom of the screen
* <C-y> - scroll viewport one line up
* <C-e> - scroll viewport one line down

## 2. Navigation

* h|j|k|l - move cursor right/down/up/left
* H|M|L   - move cursor to the top/middle/bottom of display
* warning: `J` = join lines

## 2. Jumping

### 2.1. within the line
* w - jump to beginning of next word
* W - jump to beginning of next word (greedy)
* b - jump to beginning of prev word
* B - jump to beginning of prev word (greedy)
* e - jump to end of word/ next word
* E - jump to end of word/ next word (greedy)
* 0 - jump to beginning of line
* $ - jump to end of line

### 2.2. within the buffer
* `#` jump to prev occurence of word under cursor (then N/n for next/prev)
* `*` jump to next occurence of word under cursor (then n/N for next/prev)
* `%` jump between opening and closing parentheses (before-after cursor)

### Jumplist

* :jumps - show list of recent jumps
* <c-i>  - move forward through the jumplist
* <c-o>  - move backward through the jumplist

## 3. Delete

* dd - delete current line
* d0 - delete to the beginning of line
* d$ - delete to the end of line (also `D`)
* dj = `2dd` - delete 2 lines (current and below)
* dw - delete word (from cursor to beginning of word)
* db - delete word backwards (see <C-w> in INSERT mode)

## 4. Find

* fx      - find next character ("x") in line
* Fx      - find prev character ("x") in line
		- f<space> - jump to next space between words (better than `el`)
* `*`|#   - jump to next/prev word under cursor (then n/N for next/prev)
* `/pattern` - find next occurence of "pattern" (then n/N for next/prev)
* `?pattern` - find prev occurence of "pattern" (then n/N for next/prev)
* `:noh` or `:nohl` - turn off search highligts


## 6. Buffers

* :ls           - list open buffers (files)
* :bn or :bnext - switch to next buffer
* :bp or :bprev - switch to prev buffer
* :b3           - switch to buffer 3
* <C-6>         - switch between two last used buffers

## 7. Folding

- `:set foldmethod?` - see current fold method (default: manual)
- `:setlocal foldmethod=indent` - activate folding based on intentation
- `:setlocal foldmethod=syntax` - activate folding based on syntax
- `:setlocal foldopen-=block`   - navigation commands like { and } stop at closed folds rather than opening them.

### current fold
* za - toggle the fold at the cursor position.
* zo - open   the fold at the cursor.
* zc - close  the fold at the cursor.

* zA - toggle all nested folds at the cursor.
* zO - open   all nested folds at the cursor.
* zC - close  all nested folds at the cursor.

### all folds throuout the whole buffer
* zr - reduce folding by opening one more level of folds
* zm - more   folding by closing one more level of folds
* zR - open  all folds in the buffer
* zM - close all folds in the buffer (easier navigation with zj/zk)

### fold navigation
* zj / zk - jump to next/prev fold regardless if it's closed or open

### most useful
- za, zA, zR, zM, zj/zk


## 8. Splits or Windows or Panes

* `:q` - quit/close current pane
* `:split` or `:sp`  - split horizontal
* `:vsplit` or `vsp` - split vertical
* `:term`      - open terminal (horizontal split)
* `:vert term` - open terminal (vertical split)

### Split navigation

* <C-w>w   - switch to next pane
* <C-w>h|l - switch to left (h) or right (l) pane
* <C-w>j|k - switch to up (k) or down (j) pane

## 9. Marks

* :marks - show marks
* mx - set mark x  (`mm` - most often used)
* 'x - jump back to mark x ('m - most often used)
* mX - set mark X ('X will jump across files/buffers)
* '[ - jump to the first line of the last edit
* '] - jump to the last  line of the last edit

## 10. Macros

* qwq - clear macro w, (qw) to start recording macro (w) and again (q) to immediately close recording
* qw - start recording macro w
* @w - play macro w

> note: most often used: qqq for clearing, qq to record, @q to play)

### Recurrent macro

Example: dump all files not found in custom spellcheck to a second spellfile:

- `set spellfile=CustomSpellfile.utf-8.add`
- `set spellfile+=SecondSpellFile.utf-8.add`
- `set spell`
- 'qq'  - start recording macro 'q'
- ']s'  - jump to the next word not in spellcheck
- '2zg' - add word to 2-nd spell dictionary (in this example: `SecondSpellFile.utf-8.add`)
- '@q'  - run macro within itself
- 'q'   - close recording macro

### Macros in `norm` mode

To apply the macro to a range of lines (use :normal command in Ex mode). Eexamples:
* `:5,10norm! @a` - apply the macro stored in register 'a' to lines 5 through 10.
* `:%norm! @a`    - apply macro 'a' to all lines.
* `:g/pattern/norm! @a` - apply macro 'a' to lines matching a pattern.


## 11. Increment - decrement

* <c-a> increment number under cursor
* <c-x> decremnet number under cursor
* select serveral numbers in Vissual mode
	- g<c-a> - auto-number whole column (ascending order)
	- g<c-x> - auto-number whole column (descending order)

## 12. Spelling

### Spellcheck settings

1. Global/local to buffer spell lang:
	- `set spelllang=en_US`
	- `set spelllang=`
	- `setlocal spelllang=custom`
2. Custom spell file:
	- default VIM location: /usr/share/vim/vim81/spell
	- default custom location: ~/.vim/spell/
	- create SPL file with the following command:
	- :mkspell ~/.vim/spell/custom.utf-8.spl ~/.config/vim/spell/100-most-common-Eng-words.txt
	- :mkspell! ~/.vim/spell/custom.utf-8.spl ~/.vim/spell/custom.utf-8.add
3. Spell file name for new words must end with ".utf-8.add":
	- setlocal spellfile=~/.config/vim/spell/custom.utf-8.add
	- setlocal spellfile=~/.vim/spell/custom.utf-8.add
	- setlocal spellfile=~/.vim/spell/custom.utf-8.add,c.utf-8.add
	- setlocal spellfile=c.utf-8.add
4. Toggle spellchecking feature:
	- nnoremap <leader>s :setlocal spell!<cr>
5. Test words:
	- US: memorize, color,
	- UK: memorise, colour, 

## 13. VISUAL mode

* v - start VISUAL mode, select characters
* V - start VISUAL line mode (whole lines)
* <c-v> - start VISUAL block mode, vertical block 
* vip - enter VISUAL mode, from inside, select whole paragraph
* vap - similar, cursor below last line

### in Visual mode

* o - toggle selection direction
* <c-a> and <c-x> for increment/decrement of numbers, dates, etc.

## 14. INSERT mode

* i - start writing before cursor
* I - start writing at the beginning of line
* o - new line below cursor line
* O - new line above cursor

### in INSERT mode

* <C-j> - newline
* <C-w> - delete last word
* <C-y> - copy character from line above
* <C-u> - delete last line 
* <C-i> - insert tab
* <C-o> - toggle "pseudo-Normal" mode, examples:
	- <c-o>dd - delete current line 

### Auto-complete in INSERT mode

> auto-completion uses words from the currently opened buffer (file)

* <c-n> - show list of suggestions, cursor on the first line
* <c-p> - show list of suggestions, cursor on the last line

## 15. Registers

> registers are like clipboards.
> there are 0-9 and a-z 

* :reg   - list registers
* <C-r>" - in command-mode paste default register 

## 16. Vimgrep

* :vvm[grep] /pattern/ <directory> 
* :vim /pattern/ *   - search only current directory
* :vim /pattern/ **  - search current and subdirectories

### vimgrep 

* :copen - open quick-fix list (results of vimgrep search)
	- use j/k to navigate, Enter to jump to the file
	- cp - previous item
	- cn - next item
* cdo s/oldpattern/newpattern/gc - regex to run on all items in quick-list (c = confirm)

## 17. Join lines

* `J`  - join lines with space between
* `gJ` - join lines no space between
* to join lines with a comma and a space: `:nmap J :s/\n/, /<cr>`
* to join lines with a tab: `:nnoremap J :s/\n/<tab>/<cr>`

## 18. Display non-printable chars 

* `listchars=eol:↵,tab:‹·›` - Newline = "↵", TAB = "‹···›"
* `set list`   - turn on dispaying
* `set nolist` - turn off displaying
* `set list!`  - toggle displaying

## 19. Digraphs

> digraphs are used to enter dicritics or most other Unicode symbols that are not available on the standard keyboard.

* :dig  - show table of pre-defined digraphs
* :dig! - group digraphs thematically
* <C-k>{char1}{char2} - enter digraph in INSERT mode. 

### Examples:
- <C-k>a'  - á - {x}' - apostrophe adds acute mark
- <C-k>a`  - à - {x}` - backtick adds grave mark
- <C-k>a!  - à - {x}! - adds grave mark
- <C-k>o(  - ŏ - {x}( - adds breve 
- <C-k>j<  - ǰ - {x}< - less-than adds Czech haček
- <C-k>n~  - ñ - {x}~ - tilde adds cedilla
- <C-k>a:  - ä - {x}: - colon adds umlaut/diaeresis
- <C-k>o:  - ő - {x}: - colon adds umlaut/diaeresis
- <C-k>d=  - д - {x}= - enters Russian Cyrillic
   - generally all letters can be converted to Cyrillic with the <C-k>{char}= method
   - also: <C-k>=P  - ₽ - Russian ruble symbol

## 20. Vim help

- :help topic - open help page
- <C-]> - jump to link
- <C-o> - jump back

## 21. Others

### pop-pu window

Simplest example, copy and paste to command line with <C-r>":
- `call popup_atcursor('Hello, world!', #{})`

---
