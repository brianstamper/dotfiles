" .vimrc
" Parts of this were copied from:
" /usr/share/vim/vimrc
" http://unlogic.co.uk/posts/vim-python-ide.html
"

" Try to use 256 colors
set t_Co=256
colorscheme brian

" Enable syntax highlighting
syntax on

" Highlight row/column
set cursorline cursorcolumn

" Have Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Set up pathogen https://github.com/tpope/vim-pathogen
exe pathogen#infect()
exe pathogen#helptags()

" Map Ctrl-n to open the NERDTree panel
map <C-n> :NERDTreeToggle<CR>

" Have Vim load indentation rules and plugins according to the detected filetype.
filetype plugin indent on

set autochdir       " Automatically change window's cwd to file's dir
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set autowrite       " Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a         " Enable mouse usage (all modes)

" Prefer spaces to tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Show tabs and trailing whitespace
set list!
set listchars=tab:»\ ,trail:·

" Set status line to show filename, type, hex value of character, position
set statusline=%F%M%r%h%w\ %=%{&ff}\ %Y\ $\%04.4B\ %03c\ %04l/%04L\ %3p%%
set laststatus=2

set number

