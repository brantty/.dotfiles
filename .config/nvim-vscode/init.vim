set nocompatible		    " disable compability to old-time vi
set showmatch			    " show matching
set ignorecase			    " case insensitive
set mouse=v			        " middle click paste with
set hlsearch			    " highlight search
set incsearch			    " incremental search
set tabstop=4			    " number of columns occupied by a tab
set softtabstop=4		    " see multiple spaces as tabstops so <BS> does the right thing
set expandtab			    " converts tabs to white space
set shiftwidth=4			" width for autoindents
set autoindent			    " indent a new line the same amount as the line just typed
set smarttab
set smartindent
set number			        " add line numbers
set wildmode=longest,list	" get bash-like tab completions
set cc=80			        " set an 80 column border for good coding style
filetype plugin indent on	" allow auto-indenting depending on file type
syntax on			        " syntax highlighting
set mouse=a			        " enable mouse click
set clipboard=unnamedplus	" using system clipboard
filetype plugin on
set cursorline			    " highlight current cursorline
set ttyfast			        " Speed up scrolling in vim
" set spell			        " enable spell check (may need to download language package)
" set noswapfile		    " disable creating swap file
" set backupdir=~/.cache/vim	" Directory to store backup file.

call plug#begin('~/.vim/plugged')
" plugin Section
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Keybindings
" move line or visually selected block - alt+j/k
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
" move split paneds to left/bottom/top/right
nnoremap <M-h> <C-w>H
nnoremap <M-j> <C-w>J
nnoremap <M-k> <C-w>K
nnoremap <M-l> <C-w>L
" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr>
" copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR>
" Vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif
