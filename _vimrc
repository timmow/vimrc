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
    " LSP Support
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    "  Snippets
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'rafamadriz/friendly-snippets'

    " Plug 'VonHeikemen/lsp-zero.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'folke/trouble.nvim'
    Plug 'pedrohdz/vim-yaml-folds'

    Plug 'onsails/lspkind.nvim'
    Plug 'mileszs/ack.vim',  Cond(!exists('g:vscode'))
    Plug 'junegunn/fzf', Cond(!exists('g:vscode'), { 'do': { -> fzf#install() } })
    Plug 'junegunn/fzf.vim',  Cond(!exists('g:vscode'))
    Plug 'rodjek/vim-puppet',  Cond(!exists('g:vscode'))
    Plug 'airblade/vim-rooter',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-surround',  Cond(!exists('g:vscode'))
    Plug 'justinmk/vim-sneak',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-fugitive',  Cond(!exists('g:vscode'))
    Plug 'elzr/vim-json', Cond(!exists('g:vscode'))
    Plug 'pangloss/vim-javascript',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-eunuch',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-unimpaired',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-repeat',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-rhubarb', Cond(!exists('g:vscode'))
    Plug 'tpope/vim-commentary',  Cond(!exists('g:vscode'))
    Plug 'tpope/vim-sensible',  Cond(!exists('g:vscode'))
    Plug 'python-mode/python-mode',  Cond(!exists('g:vscode'))
    Plug 'plytophogy/vim-virtualenv',  Cond(!exists('g:vscode'))
    Plug 'mattn/emmet-vim',  Cond(!exists('g:vscode'))
    Plug 'christoomey/vim-tmux-navigator', Cond(!exists('g:vscode'))
    Plug 'cypok/vim-sml',  Cond(!exists('g:vscode'))
    Plug 'Konfekt/FastFold', Cond(!exists('g:vscode'))
    Plug 'guns/vim-sexp', Cond(!exists('g:vscode'))
    Plug 'tpope/vim-sexp-mappings-for-regular-people', Cond(!exists('g:vscode'))
    Plug 'rhysd/reply.vim', Cond(!exists('g:vscode'))
    Plug 'benknoble/vim-racket', Cond(!exists('g:vscode'))
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
    Plug 'honza/vim-snippets', Cond(has('python') && !exists('g:vscode'))
    Plug 'itchyny/lightline.vim', Cond(!exists('g:vscode'))
    Plug 'vim-test/vim-test', Cond(!exists('g:vscode'))
    Plug 'direnv/direnv.vim', Cond(!exists('g:vscode'))
    Plug 'tpope/vim-dispatch', Cond(!exists('g:vscode'))
    Plug 'junegunn/rainbow_parentheses.vim', Cond(!exists('g:vscode'))
    Plug 'preservim/vimux', Cond(!exists('g:vscode'))
call plug#end()

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark

colorscheme dracula



"
" GLOBAL SETTINGS
"

" Write contents of the file, if it has been modified, on buffer exit
set autowrite

" Insert mode completion options
set completeopt=menu,menuone

" Jump to matching bracket for 2/10th of a second (works with showmatch)
set matchtime=2

" Don't highlight results of a search
set nohlsearch

" When a bracket is inserted, briefly jump to a matching one
set showmatch

" Don't request terminal version string (for xterm)
set t_RV=
" Indent options for various files
au FileType python setlocal shiftwidth=4 tabstop=4 expandtab
au FileType ruby setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
" Set a max textwidth for markdown files
au FileType markdown setlocal textwidth=80
au FileType puppet setlocal commentstring=#%s
au FileType sml setlocal commentstring=(*%s*)
au FileType go setlocal shiftwidth=2 tabstop=2 noexpandtab
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Write swap file to disk after every 50 characters
set updatecount=50

" Remember things between sessions
"
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history 
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file

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
" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 
vnoremap . .gv 

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
if !exists("g:vscode")
  set noshowmode
  let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ }
endif

set lcs=eol:$,trail:-

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
  let g:rooter_patterns = ['.git/', '.git', 'puppet.conf', '.rooter']
endif
nmap <Leader>b :Buffers<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>P :Files <C-R>=expand("%:p:h")<CR><CR>
nmap <Leader>s :write<CR>

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
let g:ack_qhandler='Trouble quickfix | wincmd p'
set foldlevelstart=99
" spellcheck things that should be
autocmd FileType gitcommit,rst,markdown setlocal spell
" disable annoying sounds
set visualbell

" in go mode, import anything which is not imported on save
let g:go_fmt_command = "goimports"
set mouse=a
if exists(':ttymouse')
  set ttymouse=xterm2
endif

" use ag/rg instead of ack if available
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
elseif executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" When editing a git commit, start from the top
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
autocmd FileType gitcommit setlocal nocindent
" for https://github.com/mhinz/neovim-remote allows me to still use wq
autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete

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

" vim-test 
"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = "dispatch"

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

" lightline
let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'readonly', 'relativepath', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:sexp_filetypes = 'clojure,scheme,lisp,timl,racket'
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme,racket RainbowParentheses
augroup END
lua <<EOF

EOF

" Vim Script
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
