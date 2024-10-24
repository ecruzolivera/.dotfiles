" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" clipboard
set clipboard=unnamedplus

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number
set relativenumber

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

set autoindent

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Search subfolders
set path+=**

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
" set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Auto read files externally modified 
set autoread                                                                                                                                                                                    

" PLUGINS """""""""""""""""""""""""""""""" {{{

" Plugin code goes here.
" call plug#begin('~/.vim/plugged')
"
"     Plug 'tyru/open-browser.vim'
"     Plug 'aklt/plantuml-syntax'
"     Plug 'weirongxu/plantuml-previewer.vim'
"     Plug 'mtdl9/vim-log-highlighting'
"     Plug 'peterhoeg/vim-qml'
"     Plug 'bkad/camelcasemotion'
"     Plug 'mg979/vim-visual-multi'
"     Plug 'morhetz/gruvbox'
"     Plug 'tpope/vim-commentary'
"     Plug 'tpope/vim-surround'
"     Plug 'vim-airline/vim-airline'
"     Plug 'vim-airline/vim-airline-themes'
"     Plug 'preservim/nerdtree'
"     Plug 'Xuyuanp/nerdtree-git-plugin'
"
" call plug#end()
" }}}


" MAPPINGS """""""""""""""""""""""""""""""- {{{

" Mappings code goes here.
nnoremap <space> <Nop>
let g:mapleader=" "

if (exists(':NERDTreeToggle'))
 nnoremap <leader>e :NERDTreeToggle<CR>
endif

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv
"for dealing with word wrap
" nnoremap k  gk   
" nnoremap j  gj   
nnoremap <leader>h :nohls<CR>
" easy colon
nnoremap ; :
" easy save
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" highlight move
vnoremap <J> :m '>+1<CR>gv=gv
vnoremap <K> :m '<-2<CR>gv=gv
" remove the break line
nnoremap J mzJ`z
" keep the cursor centered when page down/up
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" keep the cursor centered when searching next/prev
nnoremap n nzzzv
nnoremap N Nzzzv
" sane paste, will keep the copy value instead of replace it with the deleted one
xnoremap p [["_dP]])
" search outside vim
nnoremap <C-f> <cmd>silent !tmux neww tmux-sessionizer<CR>



" let g:camelcasemotion_key = '<leader>'
" }}}


" VIMSCRIPT """"""""""""""""""""""""""""""" {{{

" More Vimscripts code goes here.

" }}}


" STATUS LINE """""""""""""""""""""""""""""" {{{

" Status bar code goes here.

" }}}
" 

" SETTINGS AFTER plugins load 
" colorscheme gruvbox
set background=dark

