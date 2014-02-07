call pathogen#infect()
set autoindent
set autoread
set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set fileformats=unix,dos,mac
set laststatus=2
set linebreak
"set list
"set listchars=tab:>-,eol:¶
set number
set shiftwidth=4
set showbreak=
set showmatch
set softtabstop=4
set suffixes+=.pyc,.o,.so
set tabstop=4
set wildmenu


" http://stackoverflow.com/questions/1005/getting-root-permissions-on-a-file-inside-of-vi
cmap w!! w !sudo tee >/dev/null %


" colorscheme
if has('gui_running')
    set background=light
else
    set background=dark
endif
"colorscheme solarized
let g:solarized_termcolors=256
"set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm


"colorscheme distinguished
"colorscheme twilight

nmap \e :NERDTreeToggle<CR>
nmap \t :TagbarToggle<CR>
nmap \g :GitGutterToggle<CR>
map <C-n> :bnext<CR>
map <C-p> :bprev<CR>
nmap <C-c> :nohlsearch<CR>

"close current buffer
map \c :BW<CR>

"quit
map \z :qa!<CR>


" search tips
set ignorecase
set incsearch
set hlsearch
set smartcase

"syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

"powerline
set t_Co=256
let g:Powerline_symbols = 'fancy'

" NERD_tree.vim
let NERDTreeIgnore = ['\~$', '\.pyc$']

" ctrlp.vim (replaces FuzzyFinder and Command-T)
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
nmap ; :CtrlPBuffer<CR>

" reload buffer
fun! RefreshBuffer()
    set noconfirm
    bufdo e!
    set confirm
endfun
nmap <C-k> :call RefreshBuffer()<CR>


"============================================================================
"File:        javascript.vim
"Description: Syntax checking plugin for syntastic.vim using jshint
"Maintainer:  Matthew Kitt <mk dot kitt at gmail dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
" This is for use with jslint and node, F/ is deprecating in favor of closure
"============================================================================
"if exists('loaded_javascript_syntax_checker')
"  finish
"endif
"let loaded_javascript_syntax_checker = 1
"
"if !executable('jshint')
"  finish
"endif
"
"" Check for a .jshintrc in the cwd at startup, let that override any other configurations.
"" if filereadable(getcwd() . '/.jshintrc')
"  " let s:config = getcwd() . '/.jshintrc'
"" endif
"
"function! SyntaxCheckers_javascript_GetLocList()
"
"  if exists('s:config')
"    let makeprg = 'jshint ' . shellescape(expand("%")) . ' --config ' . s:config
"  else
"    let makeprg = 'jshint ' . shellescape(expand("%"))
"  endif
"  let errorformat = '%f: line %l\, col %c\, %m,%-G%.%#'
"  return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
"endfunction


