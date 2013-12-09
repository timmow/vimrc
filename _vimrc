"
" MAIN CUSTOMIZATION FILE
"
set nocompatible | filetype indent plugin on | syn on

if v:version > '702' 
  fun! SetupVAM()
    let c = get(g:, 'vim_addon_manager', {})
    let g:vim_addon_manager = c
    let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'
    let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
    " let g:vim_addon_manager = { your config here see "commented version" example and help
    if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
      execute '!git clone --depth=1 https://github.com/MarcWeber/vim-addon-manager '
	    \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
    endif
    call vam#ActivateAddons(['vim-ruby'], {'auto_install' : 0})
    ActivateAddons sparkup
    ActivateAddons ack
    ActivateAddons ctrlp
    ActivateAddons The_NERD_Commenter
    ActivateAddons github:rodjek/vim-puppet
    ActivateAddons rooter
    ActivateAddons surround
    ActivateAddons Solarized
    ActivateAddons EasyMotion
    ActivateAddons gnupg%3645
    ActivateAddons Syntastic
    ActivateAddons Tabular
    ActivateAddons github:kana/vim-vspec
    ActivateAddons fugitive
    ActivateAddons github:elzr/vim-json
    if has("python")
      ActivateAddons UltiSnips
    endif
  endfun
  let g:vim_addon_manager = {'scms': {'git': {}}}
  fun! MyGitCheckout(repository, targetDir)
    let a:repository.url = substitute(a:repository.url, '^git://github', 'https://github', '')
    return vam#utils#RunShell('git clone --depth=1 $.url $p', a:repository, a:targetDir)
  endfun
  let g:vim_addon_manager.scms.git.clone=['MyGitCheckout']
  call SetupVAM()

  set runtimepath+=~/.vim/vim-addon-manager/
  colorscheme solarized
endif
syntax enable


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

" Use 4 spaces for (auto)indent
set shiftwidth=2

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=

" Indent options for various files
au FileType php setlocal shiftwidth=4 tabstop=4 expandtab
au FileType ruby setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2 autoindent
" Set a max textwidth for markdown files
au FileType markdown setlocal textwidth=80

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
set guifont=Source\ Code\ Pro:h12
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
let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['ruby', 'php', 'puppet'],
                               \ 'passive_filetypes': [] }
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
" close the current html tag
imap ,/ </<C-X><C-O>
" dont use the escape key
inoremap <Esc> <Nop>
inoremap jj <Esc>
let mapleader=','
nmap <Leader>u :let  @* = expand('%:p:.:gs?\?/?')<CR>
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--report=csv --standard=PSR2'
map \cd <Plug>RooterChangeToRootDirectory
let g:rooter_patterns = ['.git/', '.git', 'puppet.conf', '.rooter']
nmap <Leader>b :CtrlPBuffer<CR>
nmap <Leader>p :CtrlP<CR>
let g:ctrlp_working_path_mode = 'a'
nmap <Leader>s :write<CR>
nmap <Leader>e :split ~/questions.txt<CR>ggOdts - 
let g:syntastic_ruby_exec='~/.rbenv/shims/ruby'

" Ultisnips
let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnipppets" ]
" Fix for incorrect path on osx
set shell=sh
" some puppet files not getting highlighted correctly
au BufRead *.pp set filetype=puppet
