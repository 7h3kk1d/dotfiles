set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'gmarik/vundle'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'python.vim'
Plugin 'rails.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'suan/vim-instant-markdown'
Plugin 'vim-ruby/vim-ruby'
" TODO vim-session

"Testing
" Plugin 'davidhalter/jedi-vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'davidhalter/jedi-vim'
Plugin 'lervag/vimtex'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'
Plugin 'neilagabriel/vim-geeknote'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-dispatch.git'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fireplace.git'
Plugin 'tpope/vim-leiningen.git'
Plugin 'tpope/vim-projectionist.git'
Plugin 'vim-scripts/Gundo'
" TODO vim-session

"Testing
Plugin 'mattn/emmet-vim'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/Gundo'
Plugin 'vim-scripts/csv.vim'
Plugin 'vim-scripts/paredit.vim'
" TODO vim-session


" Not used much
" Plugin 'vim-scripts/SQLUtilities'
Plugin 'Align'
" Plugin 'loremipsum'
noremap Y y$


call vundle#end()
filetype plugin indent on

set background=dark
colorscheme solarized
syntax enable
set t_Co=256
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
set cursorline

let mapleader = ","

map <C-n> :NERDTreeToggle<CR>

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nmap <F8> :TagbarToggle<CR>
nnoremap <leader>un :GundoToggle<CR>


" Unite Config
" CtrlP functionality using Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <C-p> :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>bu :<C-u>Unite -no-split -start-insert -buffer-name=buffer  buffer<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  map <buffer> <Esc>   <Plug>(unite_exit)
endfunction

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
autocmd FileType js :setlocal sw=2 ts=2 sts=2 " Two spaces for HTML files "

" Enable mouse support
set mouse=a

" Allow transparent background
highlight LineNr ctermbg=NONE
highlight Normal ctermbg=NONE

" Change background of git gutter
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=NONE
highlight SignColumn guibg=NONE

" System clipboard
set clipboard=unnamedplus

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
