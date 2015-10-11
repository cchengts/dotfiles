" Vundle
" install with: git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Vundle plugins
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
"Plugin 'git://git.wincent.com/command-t.git'
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'mattn/emmet-vim'
Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
"Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'Shougo/unite.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'clausreinke/typescript-tools.vim'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'sheerun/vim-polyglot'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'ciaranm/inkpot'
"gitgutter runs a script for every cursor move
"Plugin 'airblade/vim-gitgutter'
Plugin 'gregsexton/gitv'
"Plugin 'Valloric/YouCompleteMe'
" Adds better support for Javascript in tagbar. Additional steps: 
"   'npm install' in .vim/bundle/tern_for_vim
"   npm install -g git://github.com/ramitos/jsctags.git
Plugin 'marijnh/tern_for_vim'
Plugin 'JavaScript-Indent'
Plugin 'lokaltog/vim-easymotion'

" Vundle finish
call vundle#end()
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" My VIM settings
syntax on
filetype plugin indent on
runtime! macros/matchit.vim
set mouse=a
set showtabline=2
set nobackup
" set rnu
set number " to display absolute line numbers
set cursorline
set wildmenu
set lazyredraw
set showmatch
set ruler
set colorcolumn=80,+0
set shellslash
let g:texflavor='latex'
set winaltkeys=no
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
" use :retab to convert current tabs
"set foldmethod=indent
set complete=.,w,b,u,t,i
"set tags=~/.tags
set pastetoggle=<F12>
set cino=:0.5s,=0.5s,g0.5s,h0.5s,i2s,u0
set backspace=indent,eol,start
"set textwidth=76
set completeopt=longest,menuone,preview
set splitbelow
set cmdheight=2
set hidden
set laststatus=2
set incsearch
set hlsearch
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX

set nolist
if !has('win32')
    set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ 
endif


" SETUP COLORS
if &term =~ "rxvt"
    if has("terminfo")
        set t_Sf=[3%p1%dm
        set t_Sb=[4%p1%dm
    else
        set t_Sf=[3%dm
        set t_Sb=[4%dm
    endif
elseif has('win32') && !has('gui_running') && !empty($CONEMUBUILD)
    " enable 256 colors in conemu console
    set term=xterm
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    color jellybeans
endif
set t_Co=256
if has("gui_running")
"    color solarized
"    set bg=dark
    color desert
elseif &term=='xterm-256color' || &term=='rxvt-unicode-256color'
"    set bg=dark
"    let g:solarized_termcolors=256
"    color solarized
"    color lucius
    color jellybeans
elseif &term=='win32'
    color default
else
    set bg=dark
    color lucius
endif


" PLUGIN: supertab
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

" PLUGIN: ctrlp
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:12'

" PLUGIN: syntastic
let g:syntastic_cpp_compiler_options = ' -std=c++11'
" syntastic: C++11 support (clang)
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'

" PLUGIN: airline
let g:airline#extensions#tabline#enabled = 1

" PLUGIN: Ag
command! -nargs=+ Agweb :Ag -G '.*\.js$|.*\.ts$|.*\.html$' <args>
command! -nargs=+ Agcs :Ag -G '.*\.cs$' <args>

" PLUGIN: UntiSnips
" <tab> is already used by YCM
let g:UltiSnipsExpandTrigger="<c-j>"

" PLUGIN: YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
