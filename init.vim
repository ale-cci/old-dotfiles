"
" =/ Alec Vimrc /=
"

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
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vifm/vifm.vim'
Plug 'jreybert/vimagit'
" Plug 'mattn/emmet-vim'

" Colorscheme
Plug 'morhetz/gruvbox'

" JSX syntax support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" i3 syntax
Plug 'PotatoesMaster/i3-vim-syntax'
call plug#end()

set wildignore+=*.pdf,*.psd
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=node_modules/*,bower_components/*

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''



let g:ctrlp_map='<c-g>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_prompt_mappings = {
			\'AcceptSelection("e")': ['<2-LeftMouse>'],
			\'AcceptSelection("t")': ['<cr>']}


filetype plugin indent on

set mouse=a
set t_Co=256
colorscheme gruvbox
set encoding=utf8

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

map <silent> <c-m-y> :vertical resize +2<cr>
map <silent> <c-m-o> :vertical resize -2<cr>
map <silent> <c-m-u> :resize +2<cr>
map <silent> <c-m-i> :resize -2<cr>

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

let scroll_duration=6
nnoremap <silent> <c-m-k> :call smooth_scroll#up(&scroll, scroll_duration, 2)<cr>
nnoremap <silent> <c-m-j> :call smooth_scroll#down(&scroll, scroll_duration, 2)<cr>

" Remove default page scrolling behaviourr
nnoremap <c-u> <nop>
nnoremap <c-d> <nop>
nnoremap <c-f> <nop>
nnoremap <c-b> <nop>

set clipboard=unnamed


" File Compiler
nmap <C-X> :w<cr>:!compiler %<cr>


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

set exrc
set secure


function! Gliph()
	let gli = input('Gliph Id: ')
	let @g = system('echo -n "\u'.gli.'"')
	normal! "gP
endfunction
nnoremap gi :call Gliph()<cr>
