" vimrc by dominik kaeser
" dpk@pixar.com

" various
set nocompatible
set autoindent
" set smartindent " breaks python comments
set expandtab
set tabstop=2
set shiftwidth=2
set showmatch
set ruler
set incsearch
set nu
set smarttab
set softtabstop=2
set linebreak
set nojoinspaces
set ignorecase
set smartcase
set autoread
set hlsearch
set hidden
set history=100
syntax enable
filetype on
filetype plugin on
set wildignore=*.obj,*.o,*.png,*copy/*,*/build/*,*Frameworks*

" disable all gui stuff
set guioptions-=m
set guioptions-=T
set guioptions-=r

" color scheme and fonts
if has("gui_macvim")
    set guifont=Menlo:h14
    set transparency=4
    set background=dark
    set linespace=2
    colorscheme mustang
    set lines=42
    set columns=120
elseif has("gui_win32")
    set guifont=Consolas:h13:cANSI
    cd $HOME
    set lines=41
    set columns=120
elseif has("gui_gtk2")
    set guifont=Monospace\ 11
    set lines=41
    set columns=120
    colorscheme mustang
endif

" statusline layout
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&encoding},                " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=0x%-8B\                      " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" plugin config: a.vim
let g:alternateExtensions_h = "c,cpp,cxx,cc,CC,m,mm"
let g:alternateExtensions_cpp = "h,hpp"
let g:alternateExtensions_m = "h"
let g:alternateExtensions_mm = "h,hpp"

" plugin config: omnicomplete
set ofu=syntaxcomplete#Complete

" autoformat
set formatprg=par

" keymaps
let mapleader = "\\"
nmap <right> <nop>
nmap <left> <nop>
nmap <up> <nop>
nmap <down> <nop>
nmap <C-p> :cp<CR>
nmap <C-n> :cn<CR>
nmap <C-l> :TlistOpen<CR>zz
nmap <C-k> :TlistShowPrototype<CR>

" aliases
cabbr B call QNameBufInit(0, 0, 0, 0)<CR>:~
cabbr Ch cd %:h
command! -nargs=+ Ps !perl -pe <args> 
cabbr Sv sp $UNIXCONFIG/vimfiles/vimrc.vim
cabbr Sz sp ~/.zshrc
cabbr Sc sp ~/.cshrc
cabbr Sne Ex ~/box/notes
:command! -nargs=+ EE :silent!:execute ':w | :execute ":! <args> >& /tmp/vim_err" | :cope 10 | :cf /tmp/vim_err' 
:command! -nargs=* Sn e ~/Dropbox/notes/<args>.txt
:command! Hlo :silent!:execute ':highlight OverLength ctermbg=red ctermfg=white guibg=#592929 | :match OverLength /\%81v.\+/'
