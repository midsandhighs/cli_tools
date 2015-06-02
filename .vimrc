set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugins with GitHub repos
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'darkfink/vim-plist'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this lin
"
"
" -:-:-PLUGIN LINE-:-:-PLUGIN LINE-:-:-
"
"
" set the colorscheme

" enable syntax processing
syntax enable

" # of visual spaces per TAB
set tabstop=4

" # of spaces per TAB
set softtabstop=4

" tabs are actually spaces
set expandtab

" show the line numbers 
set number

" highlight the current line
set cursorline	

" correct indentation of files! 
filetype indent on

" highlight matching [{()}]
set showmatch

" visual autocomplete for cmds
set wildmenu

"Blatantly stolen from rmanly on Github/##osx-server on freenode
if has("autocmd")
    autocmd BufNew,BufNewFile,BufRead *.json set filetype=json
    autocmd BufNew,BufNewFile,BufRead *.mk set filetype=xml
    autocmd BufNew,BufNewFile,BufRead *.mobileconfig set filetype=xml
    autocmd BufNew,BufNewFile,BufRead *.plist set filetype=xml
    autocmd BufNew,BufNewFile,BufRead *.recipe set filetype=xml
    autocmd BufNew,BufNewFile,BufRead Makefile set filetype=make
    
    "Syntax of these languages is fussy over tabs vs. spaces
    autocmd FileType make setlocal ts=8 sts=0 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=0 sw=2 expandtab

    " personal preferences
    autocmd FileType py setlocal colorcolumn=80
    autocmd FileType python setlocal colorcolumn=80
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType xml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType xhtml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType awk setlocal ts=2 sts=2 sw=2 expandtab

    " remove auto-commenting for all filetypes
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
endif
