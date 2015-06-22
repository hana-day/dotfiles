filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tpope/vim-surround'
Plugin 'guns/vim-clojure-static'
Plugin 'tpope/vim-fireplace'
Plugin 'vim-scripts/paredit.vim'
Plugin 'mattn/emmet-vim'

call vundle#end()
filetype plugin indent on


"----------------------------------------------
" Fireplace(Plugin)
"----------------------------------------------

" Mappings
" --------
autocmd FileType clojure nnoremap cpe :Require!<Enter>


"----------------------------------------------
" General
"----------------------------------------------
colorscheme jellybeans

source $VIMRUNTIME/macros/matchit.vim

if exists("syntax on")
else
    syntax on
endif


" Options
" -------
set nocompatible
set t_Co=256
set number
set backspace=indent,eol,start
" In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set expandtab
" Number of spaces to use for each step of (auto)indent
set shiftwidth=4
" Number of spaces that a <Tab> in the file counts for
set tabstop=4
" Number of spaces that a <Tab> counts for while performing editing operations
set softtabstop=4
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
set swapfile
set directory=~/.vim/swap
" When there is a previous search pattern, highlight all its matches
set hlsearch
set wildmenu
set wildmode=longest:full,full
set laststatus=2
set timeout timeoutlen=500 ttimeoutlen=75
set formatoptions=lmoq
set clipboard=unnamedplus
set ambiwidth=double
set smartindent
set showmatch
set ignorecase
set smartcase
set incsearch
set backup
set backupext=.bak
set backupdir=$HOME/.vim/backup
set backupskip=/tmp/*
" search a ctags file in the current directory and up and up until $HOME
set tags=./tags,tags;$HOME
set completeopt+=menuone,longest
set autoindent
set autoread
set fileformats=unix,dos,mac
set lazyredraw
set mouse=niv
set mousemodel=popup
set smarttab
set virtualedit=block


" Auto Commands
" -------------
autocmd BufNewFile,BufRead *.jinja2 set filetype=html
autocmd BufNewFile,BufRead *.md     set filetype=markdown
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2


" Mappings
" --------
nnoremap <Leader>t :noh<ESC>


" Statusline Settings
" -------------------
set statusline=
set statusline +=%1*\ %{GetModeForStatusline()}%* "mode
set statusline +=%4*\ \ %<%F%*                    "full path
set statusline +=%5*%m%*                          "modified flag
set statusline +=%3*\[%{&ff}\]%*                  "file format
set statusline +=%3*\[%{&filetype}\]%*            "file type
set statusline +=%3*\[%{&fenc}\]%*                "file encoding
set statusline +=%2*%=%4v%*                       "virtual column number
set statusline +=%2*%5l%*                         "current line
set statusline +=%2*/%L%*                         "total lines

hi User1  ctermfg=Blue cterm=bold guifg=Blue gui=bold
hi User2  ctermfg=Grey guifg=Grey
hi User3  ctermfg=DarkGreen guifg=DarkGreen
hi User4  ctermfg=white guifg=white
hi User5  ctermfg=DarkRed guifg=DarkRed

function! GetModeForStatusline()
	let currentmode = mode()

	if currentmode == 'v'
        return 'V >>'
	elseif currentmode == 'i'
        return 'I >>'
	else
        return 'N >>'
	endif
endfunction
