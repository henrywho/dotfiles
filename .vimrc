"Vim-plug Configuration
"--------------------------------------------------------------------------------------------

set nocompatible              " be iMproved, required

call plug#begin('~/.vim/plugged')
"Bundles
"--------------------------------------------------------------------------------------------

" Usage: install via command line - `vim +PluginInstall +qall`
Plug 'vim-airline/vim-airline'    " status bar
Plug 'scrooloose/nerdtree'        " project filesystem browser
Plug 'vim-syntastic/syntastic'    " syntax checker
Plug 'kien/ctrlp.vim'             " Sublime's command-T
Plug 'slim-template/vim-slim'     " syntax highlighting for slim
Plug 'mileszs/ack.vim'            " use ack for better global searches
Plug 'nanotech/jellybeans.vim'    " color scheme
Plug 'skwp/greplace.vim'          " global search and replace
Plug 'tpope/vim-fugitive'         " git wrapper, use for git reblaming
Plug 'nelstrom/vim-qargs'         " add :Qargs command, populating argument list f rom files in quickfix
Plug 'elixir-lang/vim-elixir'

call plug#end()


"General VIM configuration
"--------------------------------------------------------------------------------------------

filetype plugin indent on             " filetype detection and settings
syntax on                             " syntax highlighting
silent! runtime macros/matchit.vim    " matchit comes with Vim
set nocompatible                      " not strictly necessary but useful in some scenarii
set backspace=indent,eol,start        " let the backspace key work "normally"
set hidden                            " hide unsaved buffers
set ignorecase                        " ignore case on searches
set incsearch                         " incremental search rules
set hlsearch                          " highlight searches, TIP: use :noh to unhighlight after a search
set laststatus=2                      " not strictly necessary but good for consistency
set ruler                             " shows line number in the status line
set number                            " set line numbers on by default
set switchbuf=useopen,usetab          " better behavior for the quickfix window and :sb
set tags=./tags;/,tags;/              " search tags files efficiently
set wildmenu                          " better command line completion, shows a list of matches
set tabstop=2 shiftwidth=2 expandtab  " set tabs to 2 spaces
set expandtab                         " ***
set noswapfile                        " disable swp file creation
set nobackup                          " ***
set nowritebackup                     " ***
set nowrap                            " no wordwrapping
colorscheme jellybeans

" quick buffer navigation
nnoremap gb :buffers<CR>:sb<Space>

autocmd QuickFixCmdPost [^l]* nested cwindow                " auto open quickfix when populated

" Key Re-mappings
" --------------------------------------------------------------------------------------------
" prev buffer
map <C-J> :bprev<CR>

" next buffer
map <C-K> :bnext<CR>

" close buffer while keeping current window layout
map <C-X> :bprev<CR>:bdelete #<CR>

" switch to normal mode from insert mode
imap jj <ESC>

" run current test file
nmap <leader>r :!rake test %<cr>

" run current test file and output to tmp log
nmap <leader>R :!rake test % &> /tmp/vim.log &<cr>

" Nerdtree configuration
" --------------------------------------------------------------------------------------------
let NERDTreeShowHidden=1

" Airline configuration
" --------------------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1

" Ack configuration
" --------------------------------------------------------------------------------------------
if executable("ag")
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" Ctrl-P configuration
" --------------------------------------------------------------------------------------------
let g:ctrlp_match_window = 'results:25' " increase result limit

" Syntastic configuration
" --------------------------------------------------------------------------------------------
" let g:syntastic_ruby_checkers = ['rubocop']

" let mvim run shell commands
set shell=/bin/sh

" show EOL character, set it to ¬
set list
set listchars=eol:¬
