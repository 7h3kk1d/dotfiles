set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'kien/ctrlp.vim'
Plugin 'python.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'majutsushi/tagbar'
Plugin 'ervandew/supertab'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-ruby/vim-ruby'
Plugin 'rails.vim'
" TODO vim-session

"Testing
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'vim-scripts/Gundo'
Plugin 'tpope/vim-surround'


" Not used much
Plugin 'vim-scripts/SQLUtilities'
Plugin 'Align'
Plugin 'loremipsum'
noremap Y y$


call vundle#end()
filetype plugin indent on

set background=dark
colorscheme solarized
syntax enable
set t_Co=256
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1

let mapleader = ","

map <C-n> :NERDTreeToggle<CR>

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <leader>un :GundoToggle<CR>

" Persistent undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories

autocmd BufEnter * let &titlestring = ' ' . expand("%t")
set expandtab
set nu
set laststatus=2
set hidden
set sw=4 ts=4 sts=4
autocmd FileType html :setlocal sw=2 ts=2 sts=2 " Two spaces for HTML files "
autocmd FileType htmldjango :setlocal sw=2 ts=2 sts=2 " Two spaces for HTML files "

" Enable mouse support
set mouse=a
