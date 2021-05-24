set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'docunext/closetag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
" Plugin 'vim-scripts/hgrev'
Plugin 'Lokaltog/vim-distinguished'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'msanders/snipmate.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jnwhiteh/vim-golang'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'sickill/vim-monokai'
Plugin 'moll/vim-bbye'
Plugin 'chrisbra/csv.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'elixir-editors/vim-elixir'
Plugin 'editorconfig/editorconfig-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" colorscheme
set background=dark
colorscheme monokai


" search tips
set ignorecase
set incsearch
set hlsearch
set smartcase

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_python_checkers = ['flake8']

" nerdtree
let NERDTreeShowHidden=1

nmap \e :NERDTreeToggle<CR>
nmap \t :TagbarToggle<CR>
nmap \g :GitGutterToggle<CR>
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>
nmap <C-c> :nohlsearch<CR>

"close current buffer
map \c :Bdelete<CR>

"quit
map \z :qa!<CR>


set backspace=indent,eol,start
set fileformats=unix,dos,mac
set number
set encoding=utf-8
set ts=4 sw=4

" tidy commaonds
command Thtml :%!tidy -q -i --show-errors 0
command Txml  :%!tidy -q -i --show-errors 0 -xml
