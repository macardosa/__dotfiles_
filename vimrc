set nocompatible
set number relativenumber
set autochdir
filetype plugin indent on
syntax on
set encoding=utf-8 

if system('uname -s') == "Darwin\n"
    set clipboard=unnamed "OSX
else
    set clipboard=unnamedplus "Linux
endif

" Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

" Cursor shape
if system('uname -s') == "Darwin\n"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
else
    if has("autocmd")
      au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
      au InsertEnter,InsertChange *
        \ if v:insertmode == 'i' |
        \   silent execute '!echo -ne "\e[5 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[3 q"' | redraw! |
        \ endif
      au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
    endif
endif

" Managing temporary files
"set directory=~/.vim/swap//
"set backupdir=~/.vim/backup//
"set undodir=~/.vim/undo//

" Fortran
let fortran_do_enddo=1
let fortran_more_precise=1
let fortran_have_tabs=1

"  Mappings
nmap <leader>ff :FZF<CR>
" Unconscious settings
set spell spelllang=en_us
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set scrolloff=3
set autoindent
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
" set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set undofile

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

set autoread
set wildmenu

set complete+=kspell
set hls
set nrformats=
set showcmd

