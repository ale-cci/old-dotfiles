
" =/ Alec Vimrc /=
"
set exrc
autocmd! BufWritePost init.vim source %
autocmd BufWritePost .Xresources !xrdb %


let mapleader=','

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-smooth-scroll'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'

" JSX syntax support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

call plug#end()

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enables = 1
let g:airline_theme='gruvbox'
let g:Powerline_symbols='unicode'
filetype plugin indent on

set mouse=a
set t_Co=256
colorscheme gruvbox
set encoding=utf-8

syntax on
set undolevels=700
set history=700
set relativenumber

" For god sake, no backup file
set noswapfile
set nobackup
set nowritebackup

" Shortcuts for moving between splits
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-h> <C-w>h

" Center matched word in the middle of the screen
map n nzz
map N Nzz

set hlsearch
set incsearch
nnoremap <CR> :nohlsearch<CR>


map <Leader>v <esc>:tabprevious<CR>
map <Leader>n <esc>:tabnext<CR>

vnoremap < <gv
vnoremap > >gv

" Unbinding arrow keys
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

" Auto-Delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

let scroll_duration=10
nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, scroll_duration, 2)<cr>
nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, scroll_duration, 2)<cr>
nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll, 2*scroll_duration, 4)<cr>
nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll, 2*scroll_duration, 4)<cr>

" Copy and paste from vim
vnoremap <C-c> "*y :let @+=@*<CR>
noremap <C-v> "+P
inoremap <C-v> <Esc>"+P

" Save without exiting insert mode
nmap <C-X> :!execute %<cr>
" inoremap <C-i> <Esc>I
" inoremap <C-a> <Esc>A

" Split window to right by default
set spr
set sb

set noexpandtab
set shiftwidth=4
set tabstop=4

" Show current cursor line
set cursorline
set scrolloff=5

" Removing binding for Ex mode
nnoremap Q <nop>
map q: <Nop>

set secure
