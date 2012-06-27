"
" MAIN CUSTOMIZATION FILE
"
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()


syntax enable
set background=dark

if hostname() == 'Tim-Mowers-iMac.local'
	set t_Co=256
	let g:solarized_termcolors=256
endif

colorscheme solarized
if has('unix') 
	"set t_Co=256
	"colorscheme railscasts
endif

if has ('gui_running')
	" colorscheme railscasts
else
	colorscheme elflord
	set term=xterm
endif

if has('win32')
	cd z:\exemplar
	au GUIEnter * simalt ~x
endif
" Enable loading filetype and indentation plugins
filetype plugin on
filetype indent on

" Turn syntax highlighting on

"
" GLOBAL SETTINGS
"

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Allow backspacing over everything
set backspace=indent,eol,start

" Insert mode completion options
set completeopt=menu,longest,preview

" Use UTF-8 as the default buffer encoding
set enc=utf-8

" Remember up to 100 'colon' commmands and search patterns
set history=100

" Enable incremental search
set incsearch

" Always show status line, even for one window
set laststatus=2

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Don't highlight results of a search
set nohlsearch

" Enable CTRL-A/CTRL-X to work on octal and hex numbers, as well as characters
set nrformats=octal,hex,alpha

" Use F10 to toggle 'paste' mode
set pastetoggle=<F10>

" Show line, column number, and relative position within a file in the status line
set ruler

" Scroll when cursor gets within 3 characters of top/bottom edge
set scrolloff=3

" Round indent to multiple of 'shiftwidth' for > and < commands
set shiftround

" Use 4 spaces for (auto)indent
set shiftwidth=2

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Use 4 spaces for <Tab> and :retab
set tabstop=2
set noexpandtab

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history 
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%20,n~/.viminfo

" Use menu to show command-line completion (in 'full' case)
set wildmenu

" Set command-line completion mode:
"   - on first <Tab>, when more than one match, list all matches and complete
"     the longest common  string
"   - on second <Tab>, complete the next full match and show menu
set wildmode=list:longest,full

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif

" Fix my <Backspace> key (in Mac OS X Terminal)
set t_kb=
fixdel

" Avoid loading MatchParen plugin
let loaded_matchparen = 1

" netRW: Open files in a split window
let g:netrw_browse_split = 1

"
" MAPPINGS
"

" save changes
map ,s :w<CR>
" exit vim without saving any changes
map ,q :q!<CR>
" exit vim saving changes
map ,w :x<CR>
" switch to upper/lower window quickly
map <C-J> <C-W>j
map <C-K> <C-W>k
map j gj
map k gk
" use CTRL-F for omni completion
imap <C-F> 
" map CTRL-L to piece-wise copying of the line above the current one
imap <C-L> @@@<ESC>hhkywjl?@@@<CR>P/@@@<CR>3s
" map ,f to display all lines with keyword under cursor and ask which one to
" jump to
nmap ,f [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" use <F6> to toggle line numbers
nmap <silent> <C-l> :set number!<CR>
" page down with <Space>
nmap <Space> <PageDown>
" open filename under cursor in a new window (use current file's working
" directory) 
nmap gf :new %:p:h/<cfile><CR>
" map <Alt-p> and <Alt-P> to paste below/above and reformat
nnoremap <Esc>P  P'[v']=
nnoremap <Esc>p  p'[v']=
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 
vnoremap . .gv 

" Generic highlight changes
"highlight Comment cterm=none ctermfg=Gray
"highlight IncSearch cterm=none ctermfg=Black ctermbg=DarkYellow
"highlight Search cterm=none ctermfg=Black ctermbg=DarkYellow
"highlight String cterm=none ctermfg=DarkGreen
"highlight treeDir cterm=none ctermfg=Cyan
"highlight treeUp cterm=none ctermfg=DarkYellow
"highlight treeCWD cterm=none ctermfg=DarkYellow
"highlight netrwDir cterm=none ctermfg=Cyan



"
" NERDTree configuration
"

" Increase window size to 35 columns
" let NERDTreeWinSize=35

" map <F7> to toggle NERDTree window
nmap <silent> <F7> :NERDTreeToggle Z:\exemplar<CR>
nmap <F10> :let php_folding = 1<CR>:e<CR>
nmap <F11> :let php_folding = 0<CR>:e<CR>
set ff=unix
set smartcase
set ignorecase
set smartindent
set gfn=Inconsolata:h14
set tags=tags,Z:\sf_tags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
let g:netrw_cygwin=0
let g:netrw_scp_cmd='"c:\Program Files\PuTTY\pscp.exe" -q -batch'
let g:netrw_sftp_cmd='"c:\Program Files\PuTTY\psftp.exe"'
set makeprg=\"c:\\Program\ Files\\phpDesigner\\PHP\\php.exe\"\ \-l\ %
set errorformat=%m\ in\ %f\ on\ line\ %l

" Turn off useless toolbar
set guioptions-=T
" Turn off menu bar (toggle with CTRL+F11)
set guioptions-=m
" Turn off right-hand scroll-bar (toggle with CTRL+F7)
set guioptions-=r
" CTRL+F11 to toggle the menu bar
nmap <C-F11> :if &guioptions=~'m' \| set guioptions-=m \| else \| set guioptions+=m \| endif<cr>
" CTRL+F7 to toggle the right-hand scroll bar
nmap <C-F7> :if &guioptions=~'r' \| set guioptions-=r \| else \| set guioptions+=r \| endif<cr>
" source ~/vimfiles/php-doc.vim
" inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 
au BufRead *.yml set foldmethod=indent
" Dialog box on closing and edited buffer
set confirm
set foldcolumn=2
"nmap dvd odie(var_dump());hhi
"die var_dump a variable - prob a better way to get the variable
nmap dvd viwyodie(var_dump());hhP
set complete -=t,i
set statusline=%<%F\ %y[%{&ff}]\ %m%r%w%a\ %=%l/%L,%c%V\ %P\ %#IncSearch#%{getcwd()}

nmap <silent> <C-c> :let  @* = expand('%:p')<CR>
set lcs=eol:$,trail:-
vmap dv "zyodie(var_dump(<C-R>z));<CR><ESC>
set hlsearch
set hl+=l:IncSearch
nmap <F8> :set hls!<bar>set hls?<CR>
nmap `n :tabn<CR>
nmap `p :tabp<CR>

" Mappings for filename to clipboard. Filename is relative to current dir,
" useful for switching to CLI. On a windows system, ctrl-u will replace the \
" with / 
nmap <silent> <C-c> :let  @* = expand('%:p')<CR>
nmap <silent> <C-u> :let  @* = expand('%:p:.:gs?\?/?')<CR>

" Dont clutter up system with swp files
set directory=~/tmp
iab <expr> dts strftime("%c")

if has("gui_macvim")
	set fuopt+=maxhorz
endif

" sparkup mapping conflicts with vim completion in php
let g:sparkupNextMapping='<c-}>'
" Command will cd to the same file in a directory above the current.  Useful
" for comparing release branch to trunk when in separate checkouts
command -nargs=1 Eother exec 'edit '. '../' . substitute(expand('%:p'), getcwd(), <q-args>, '')
nmap ,r @='^f i -r 45261<C-V><ESC>j'<CR>
nmap ,e /-d2f j^
set directory=~/tmp
