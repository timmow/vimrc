set nocompatible

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/vim-addons')
    Plug 'mileszs/ack.vim',  Cond(!exists('g:vscode'))
    Plug 'junegunn/fzf', Cond(!exists('g:vscode'), { 'do': { -> fzf#install() } })
    Plug 'junegunn/fzf.vim',  Cond(!exists('g:vscode'))
    Plug 'rodjek/vim-puppet',  Cond(!exists('g:vscode'))
    Plug 'airblade/vim-rooter',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-surround',  Cond(!exists('g:vscode'))
    Plug 'justinmk/vim-sneak',  Cond(!exists('g:vscode'))
    Plug 'jamessan/vim-gnupg',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-fugitive',  Cond(!exists('g:vscode'))
    Plug 'elzr/vim-json', Cond(!exists('g:vscode'))
    Plug 'pangloss/vim-javascript',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-eunuch',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-unimpaired',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-repeat',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-rhubarb', Cond(!exists('g:vscode'))
    Plug 'tpope/vim-commentary',  Cond(!exists('g:vscode'))
    Plug 'python-mode/python-mode',  Cond(!exists('g:vscode'))
    Plug 'plytophogy/vim-virtualenv',  Cond(!exists('g:vscode'))
    Plug 'mattn/emmet-vim',  Cond(!exists('g:vscode'))
    Plug 'christoomey/vim-tmux-navigator', Cond(!exists('g:vscode'))
    Plug 'cypok/vim-sml',  Cond(!exists('g:vscode'))
    Plug 'vim-scripts/paredit.vim',  Cond(!exists('g:vscode'))
    Plug 'Konfekt/FastFold', Cond(!exists('g:vscode'))
    Plug 'tmhedberg/SimpylFold', Cond(!exists('g:vscode'))
    Plug 'gabrielelana/vim-markdown', Cond(!exists('g:vscode'))
    Plug 'fatih/vim-go',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-sleuth',  Cond(!exists('g:vscode'))
    Plug 'lervag/vimtex',  Cond(!exists('g:vscode'))
    Plug 'elixir-lang/vim-elixir',  Cond(!exists('g:vscode'))
    Plug 'kchmck/vim-coffee-script',  Cond(!exists('g:vscode'))
    Plug 'hashivim/vim-terraform', Cond(!exists('g:vscode'))
    Plug 'tmux-plugins/vim-tmux',  Cond(!exists('g:vscode'))
    Plug 'drmingdrmer/vim-indent-lua',  Cond(!exists('g:vscode'))
    Plug 'w0rp/ale', Cond(!exists('g:vscode'))
    Plug 'wincent/terminus', Cond(!exists('g:vscode'))
    Plug 'airblade/vim-gitgutter', Cond(!exists('g:vscode'))
    Plug 'junegunn/vim-easy-align',  Cond(!exists('g:vscode'))
    Plug 'google/vim-jsonnet',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-tbone', Cond(!exists('g:vscode'))
    Plug 'hjson/vim-hjson', Cond(!exists('g:vscode'))
    Plug 'ryvnf/readline.vim', Cond(!exists('g:vscode'))
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'SirVer/ultisnips', Cond(has('python') && !exists('g:vscode'))
    Plug 'Trevoke/ultisnips-rspec', Cond(has('python') && !exists('g:vscode'))
    Plug 'honza/vim-snippets', Cond(has('python') && !exists('g:vscode'))
call plug#end()

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark

colorscheme dracula

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
au FileType python setlocal shiftwidth=4 tabstop=4 expandtab
au FileType ruby setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 autoindent
au FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 autoindent
" Set a max textwidth for markdown files
au FileType markdown setlocal textwidth=80
au FileType puppet setlocal commentstring=#%s
au FileType sml setlocal commentstring=(*%s*)
au FileType go setlocal shiftwidth=2 tabstop=2 noexpandtab
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab foldmethod=indent

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

map j gj
map k gk
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

set ff=unix
set smartcase
set ignorecase
set guifont=Source\ Code\ Pro:h14

" Turn off useless toolbar
set guioptions-=T
" Turn off menu bar
set guioptions-=m
" Turn off right-hand scroll-bar
set guioptions-=r
au BufRead *.yml set foldmethod=indent
" Dialog box on closing and edited buffer
set confirm
set foldcolumn=2
set complete -=t,i
if !exists("g:vscode")
  set statusline=%<%f\ %y[%{&ff}]\ %m%r%w%a\ %=%l/%L,%c%V\ %P\ %#IncSearch#%{getcwd()}
endif

nmap <silent> <C-c> :let  @* = expand('%:p')<CR>
set lcs=eol:$,trail:-
set hlsearch
nmap <F8> :set hls!<bar>set hls?<CR>

" Dont clutter up system with swp files - double slash means same file names
" under different path do not clash
set directory=~/tmp//
set backupdir=~/tmp//
iab <expr> dts strftime("%c")

if has("gui_macvim")
	set fuopt+=maxhorz
endif

" dont use the escape key
if !exists("g:vscode")
  inoremap <Esc> <Nop>
endif
inoremap <esc>^[ <esc>^[
inoremap jk <Esc>
inoremap jj <Nop>
let mapleader=','
let maplocalleader=','
nmap <Leader>u :let  @* = expand('%:p:.:gs?\?/?')<CR>
if !exists('g:vscode')
  map \cd <Plug>RooterChangeToRootDirectory
  let g:rooter_patterns = ['.git/', '.git', 'puppet.conf', '.rooter']
endif
nmap <Leader>b :Buffers<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>s :write<CR>
nmap <Leader>e :split ~/questions.txt<CR>ggOdts - 

" Ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnipppets" ]
" some puppet files not getting highlighted correctly
au BufRead *.pp set filetype=puppet

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
" for https://github.com/mhinz/neovim-remote allows me to still use wq
autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete

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
let g:puppet_align_hashes = 0

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" keep buffers active when movign between them for undo history
set hidden

" vim-test bindings
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }
call SourceIfExists("~/.vimrc.local")

" vim-sneak
let g:sneak#label = 1
