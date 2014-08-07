" .vimrc
" Parts of this were copied from:
" /usr/share/vim/vimrc
" http://unlogic.co.uk/posts/vim-python-ide.html
"

set nocompatible

" Switching from vundle to neobundle..
" Following install guide on https://github.com/Shougo/neobundle.vim
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
     \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'm2mdas/phpcomplete-extended'

" https://github.com/scrooloose/nerdtree
NeoBundle 'scrooloose/nerdtree'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" Enable omnicomplete for phpcomplete-extended
autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

" Try to use 256 colors
set t_Co=256
colorscheme brian

" Enable syntax highlighting
syntax on

" Highlight row/column
set cursorline cursorcolumn

" Have Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Map Ctrl-n to open the NERDTree panel
map <C-n> :NERDTreeToggle<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Map buffer next, previous and close
map <F7> :bn<CR>
map <F6> :bp<CR>
map <C-F12> :bd<CR>

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

