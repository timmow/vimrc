set nocompatible
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/vim-addons')
    Plug 'rstacruz/sparkup'
    Plug 'mileszs/ack.vim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'rodjek/vim-puppet'
    Plug 'airblade/vim-rooter'
    Plug 'tpope/vim-surround'
    Plug 'altercation/vim-colors-solarized'
    Plug 'easymotion/vim-easymotion'
    Plug 'jamessan/vim-gnupg'
    Plug 'godlygeek/tabular'
    Plug 'kana/vim-vspec'
    Plug 'tpope/vim-fugitive'
    Plug 'elzr/vim-json'
    Plug 'pangloss/vim-javascript'
    Plug 'tpope/vim-eunuch'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-commentary'
    Plug 'Trevoke/ultisnips-rspec'
    Plug 'avakhov/vim-yaml'
    Plug 'python-mode/python-mode'
    Plug 'plytophogy/vim-virtualenv'
    Plug 'mattn/emmet-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'cypok/vim-sml'
    Plug 'vim-scripts/paredit.vim'
    Plug 'Konfekt/FastFold'
    Plug 'gabrielelana/vim-markdown'
    Plug 'fatih/vim-go'
    Plug 'tpope/vim-sleuth'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    Plug 'lervag/vimtex'
    Plug 'elixir-lang/vim-elixir'
    Plug 'kchmck/vim-coffee-script'
    Plug 'hashivim/vim-terraform'
    Plug 'tmux-plugins/vim-tmux'
    Plug 'drmingdrmer/vim-indent-lua'
    Plug 'w0rp/ale'
    Plug 'wincent/terminus'
    Plug 'airblade/vim-gitgutter'
    if has("python")
      Plug 'SirVer/ultisnips'
      Plug 'honza/vim-snippets'
    endif
call plug#end()


colorscheme solarized


set t_Co=256
let g:solarized_termcolors=256

set background=dark

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

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Indent options for various files
au FileType php setlocal shiftwidth=4 tabstop=4 expandtab
au FileType python setlocal shiftwidth=4 tabstop=4 expandtab
au FileType ruby setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 autoindent
au FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 autoindent
" Set a max textwidth for markdown files
au FileType markdown setlocal textwidth=80
au FileType puppet setlocal commentstring=#%s
au FileType sml setlocal commentstring=(*%s*)
au FileType go setlocal shiftwidth=2 tabstop=2 noexpandtab

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history 
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file

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
if exists(':fixdel')
  fixdel
endif

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
" map CTRL-R to piece-wise copying of the line above the current one
inoremap <C-R> @@@<Esc>hhkywjl?@@@<CR>P/@@@<CR>3s
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
set cindent
set guifont=Source\ Code\ Pro:h14
set tags=tags,Z:\sf_tags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
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
au BufRead *.yml set foldmethod=indent
" Dialog box on closing and edited buffer
set confirm
set foldcolumn=2
"nmap dvd odie(var_dump());hhi
"die var_dump a variable - prob a better way to get the variable
nmap dvd viwyodie(var_dump());hhP
set complete -=t,i
set statusline=%<%f\ %y[%{&ff}]\ %m%r%w%a\ %=%l/%L,%c%V\ %P\ %#IncSearch#%{getcwd()}

nmap <silent> <C-c> :let  @* = expand('%:p')<CR>
set lcs=eol:$,trail:-
vmap dv "zyodie(var_dump(<C-R>z));<CR><ESC>
set hlsearch
nmap <F8> :set hls!<bar>set hls?<CR>
nmap `n :tabn<CR>
nmap `p :tabp<CR>

" Mappings for filename to clipboard. Filename is relative to current dir,
" useful for switching to CLI. On a windows system, ctrl-u will replace the \
" with / 
nmap <silent> <C-c> :let  @* = expand('%:p')<CR>

" Dont clutter up system with swp files - double slash means same file names
" under different path do not clash
set directory=~/tmp//
set backupdir=~/tmp//
iab <expr> dts strftime("%c")

if has("gui_macvim")
	set fuopt+=maxhorz
endif

" sparkup mapping conflicts with vim completion in php
let g:sparkupNextMapping='<c-}>'
" Command will cd to the same file in a directory above the current.  Useful
" for comparing release branch to trunk when in separate checkouts
"command -nargs=1 Eother exec 'edit '. '../' . substitute(expand('%:p'), getcwd(), <q-args>, '')
nmap ,r @='^f i -r 45261<C-V><ESC>j'<CR>
nmap ,e /-d2f j^
" close the current html tag
imap ,/ </<C-X><C-O>
" dont use the escape key
inoremap <Esc> <Nop>
inoremap <esc>^[ <esc>^[
inoremap jk <Esc>
inoremap jj <Nop>
let mapleader=','
let maplocalleader=','
nmap <Leader>u :let  @* = expand('%:p:.:gs?\?/?')<CR>
map \cd <Plug>RooterChangeToRootDirectory
let g:rooter_patterns = ['.git/', '.git', 'puppet.conf', '.rooter']
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>p :CtrlP<CR>
let g:ctrlp_working_path_mode = 'a'
nmap <Leader>s :write<CR>
nmap <Leader>e :split ~/questions.txt<CR>ggOdts - 

" Ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnipppets" ]
" some puppet files not getting highlighted correctly
au BufRead *.pp set filetype=puppet
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

let g:fugitive_github_domains = ['github.com', 'github.gds']
let g:vim_json_syntax_conceal = 0 

" u is for word '*U*nder cursor'
nnoremap cue :%s/\<<C-r><C-w>\>/<C-r><C-w>
nnoremap cub :%s/\<<C-r><C-w>\>/<C-r><C-w><S-Left>
nnoremap du :%s/\<<C-r><C-w>\>/

" pymode settings
let g:pymode_breakpoint_bind = '<Leader>s'
" I'll ask when I want autocomplete
let g:pymode_rope_complete_on_dot = 0
" use ale instead - less obtrusive
let g:pymode_lint = 0
:let g:pymode_rope = 0

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" force md files to be markdown, not modula
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Diffs open in a vertical split by default
set diffopt+=vertical
let g:virtualenv_directory='~/envs'
" Show but dont focus the quickfix window when acking
let g:ack_qhandler='botright cwindow'
set foldlevelstart=99
" spellcheck things that should be
autocmd FileType gitcommit,rst,markdown setlocal spell
let g:niji_dark_colours = [
    \ [ '81', '#5fd7ff'],
    \ [ '99', '#875fff'],
    \ [ '1',  '#dc322f'],
    \ [ '76', '#5fd700'],
    \ [ '3',  '#b58900'],
    \ [ '2',  '#859900'],
    \ [ '6',  '#2aa198'],
    \ [ '4',  '#268bd2'],
    \ ]
" disable annoying sounds
set visualbell

" in go mode, import anything which is not imported on save
let g:go_fmt_command = "goimports"
set mouse=a
if exists(':ttymouse')
  set ttymouse=xterm2
endif

" use ag instead of ack if available
if executable('ag')
	  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" When editing a git commit, start from the top
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
autocmd FileType gitcommit setlocal nocindent

" autoread option works with vim-tmux-focus-events to autoreload files changed
" outside of vim and prevent an annoying error message telling you the file
" has changed
set autoread

let g:tex_flavor = 'latex'

let g:vimtex_view_method = 'skim'

let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
function! UpdateSkim(status)
  if !a:status | return | endif

  let l:out = b:vimtex.out()
  let l:tex = expand('%:p')
  let l:cmd = [g:vimtex_view_general_viewer, '-r']
  if !empty(system('pgrep Skim'))
    call extend(l:cmd, ['-g'])
  endif
  if has('nvim')
    call jobstart(l:cmd + [line('.'), l:out, l:tex])
  elseif has('job')
    call job_start(l:cmd + [line('.'), l:out, l:tex])
  else
    call system(join(l:cmd + [line('.'),
          \ shellescape(l:out), shellescape(l:tex)], ' '))
  endif
endfunction

" Keep all vim-related temp files in a single directory
let $TMPDIR = '/tmp/vim-' . $USER
silent! call mkdir($TMPDIR, '', 0700)

" Update vim git gutter quicker
set updatetime=100
