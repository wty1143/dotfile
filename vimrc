" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'flazz/vim-colorschemes'

" Status bar
" Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Nerdtree
Plugin 'scrooloose/nerdtree'

" ctags
Plugin 'universal-ctags/ctags'
Plugin 'craigemery/vim-autotag'

" cscope
Plugin 'vim-scripts/autoload_cscope.vim'
Plugin 'chazy/cscope_maps'

" fzf
" Most commands support CTRL-T / CTRL-X / CTRL-V key bindings to
" open in a new tab, a new split, or in a new vertical split
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" auto-pair to delete matched parentheses
Plugin 'jiangmiao/auto-pairs'

" For git
Plugin 'tpope/vim-fugitive'

" Misc
Plugin 'xolox/vim-misc'

" incsearch.vim incrementally highlights ALL pattern matches unlike default 'incsearch'.
Plugin 'haya14busa/incsearch.vim'

" tagbar
Plugin 'preservim/tagbar'

" unite
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'

" Fancy page
Plugin 'mhinz/vim-startify'

" Open with line
Plugin 'bogado/file-line'

" Better whilespace
" Plugin 'ntpeters/vim-better-whitespace'

" Syntax check
" Plugin 'scrooloose/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required

filetype on
set fileformat=unix

" Color Scheme
syntax enable
set t_Co=256
set background=dark
"colorscheme mytheme
colorscheme Tomorrow-Night-Bright

set backspace=2
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set softtabstop=4
set incsearch
set number
set cursorline

" change cursor by mouse
" set mouse=i

" enable scrolling
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" map Ctrl+a (move to beginning of line) and Ctrl+e (move to end of line)
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

" Use enter instead of Ctrl+Y to select autocomplete popup menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" highligh all word when search
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
" map *  <Plug>(incsearch-nohl-*)
" map #  <Plug>(incsearch-nohl-#)
" map g* <Plug>(incsearch-nohl-g*)
" map g# <Plug>(incsearch-nohl-g#)

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic
let g:syntastic_error_symbol = "\u2717"
let g:syntastic_warning_symbol = "\u26A0"
let g:syntastic_enable_balloons = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" tags/cscope
set tags=tags;
let g:autocscope_menus=0
set hidden

" Tagbar
nmap <F8> :TagbarToggle<CR>

" fzf
nnoremap <C-P> :FZF<CR>

" ,tc/Ctrl+l/Ctrl+h
let mapleader = ","
nmap <leader>tc :tabnew<CR>
nmap <C-H> :tabprev<CR>
nmap <C-L> :tabnext<CR>

" outline
nnoremap <leader>o :Unite -start-insert -vertical -winwidth=60 outline<CR>

" regenerate tags
nmap <silent><F5> :!fd . --type=f -e cpp -e c -e h -e hpp --color=never > cscope.files && cscope -Rbkq && ctags -L cscope.files --extra=+f<CR>:cs reset<CR><CR>
