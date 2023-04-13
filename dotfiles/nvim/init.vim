" Plugin manager and plugins
set nocompatible
filetype off
set rtp+=/home/pierrick/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ngmy/vim-rubocop'
Plugin 'dense-analysis/ale'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'machakann/vim-highlightedyank'
Plugin 'dag/vim-fish'
call vundle#end()

" General config
syntax on
filetype plugin indent on
set colorcolumn=81
set number
set noswapfile
set nobackup
set nowb
set hlsearch
set ignorecase
set incsearch
set showcmd
set backspace=indent,eol,start
set cursorline
set laststatus=2
set confirm
set undofile
set undodir=~/.nvim_undodir
set t_Co=256

" ALE
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:ale_virtualtext_cursor = 0

" Theme
colorscheme gruvbox
set bg=dark

" Airline status bar
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%l/%L-%c'
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#ale#enabled = 1

" 2 spaces for indentation
autocmd FileType ruby setlocal ts=2 sts=0 sw=2 et ai sta
autocmd FileType sh setlocal ts=2 sts=0 sw=2 et ai sta
autocmd FileType yaml setlocal ts=2 sts=0 sw=2 et ai sta
autocmd FileType yml setlocal ts=2 sts=0 sw=2 et ai sta
autocmd FileType javascript setlocal ts=2 sts=0 sw=2 et ai sta
" 4 spaces for indentation
autocmd FileType awk setlocal ts=4 sts=0 sw=4 et ai sta
autocmd FileType i3config setlocal ts=4 sts=0 sw=4 et ai sta
autocmd FileType rust setlocal ts=4 sts=0 sw=4 et ai sta

" Git commit message width
autocmd FileType gitcommit setlocal tw=72

" Autoremove trailing whitespaces macro
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
command! TrimWhitespace call TrimWhitespace()
autocmd BufWritePre * call TrimWhitespace()

" Nvim hotkeys
let mapleader = "\<Space>"
inoremap kj <ESC>
nmap cl :noh<CR>
nmap <Leader>w :w<CR>
nnoremap <leader><leader> <c-^>

" Ruby hotkeys
let g:vimrubocop_keymap = 0
nmap <Leader>rc :RuboCop<CR>

" Rust hotkeys
nmap <Leader>rf :RustFmt<CR>

" C hotkeys
nmap <Leader>gcc :! gcc -o compiled_output %<CR>

" Autosource nvim config file
autocmd bufwritepost ~/.config/nvim/init.vim source $MYVIMRC
