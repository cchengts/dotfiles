" Vundle
" install with: git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Vundle plugins
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
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'sheerun/vim-polyglot'
Plugin 'ervandew/supertab'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'ciaranm/inkpot'
Plugin 'airblade/vim-gitgutter'
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
filetype plugin indent on
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
set nocp
if &term =~ "rxvt"
    if has("terminfo")
        set t_Co=8
        set t_Sf=[3%p1%dm
        set t_Sb=[4%p1%dm
    else
        set t_Co=8
        set t_Sf=[3%dm
        set t_Sb=[4%dm
    endif
endif
set t_Co=256
"set t_AB=[48;5;%dm
"set t_AF=[38;5;%dm
syntax on
set mouse=a
set showtabline=2
set nobackup
" set rnu
set nu " to display absolute line numbers
set ruler
set cc=80,+0
filetype plugin on
set shellslash
filetype indent on
let g:texflavor='latex'
set winaltkeys=no
"let Tlist_Ctags_Cmd="C:/Users/cheng/vimfiles/ctags.exe"
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
"set list
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ 
"set textwidth=76
" source $RUNTIME/mswin.vim " Enable Windows like shortcuts
" behave mswin " Enable Windows like mouse/key behavior
" set term=xterm-255color
" if &term=='builtin_gui'
if has("gui_running")
"    color solarized
    color desert
"    set bg=dark
elseif &term=='xterm-256color' || &term=='rxvt-unicode-256color'
"    set bg=dark
"    let g:solarized_termcolors=256
"    color solarized
"    color lucius
    color jellybeans
else
    set bg=dark
    color lucius
endif
" supertab plugin
let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'


" pathogen
"execute pathogen#infect()

" Omnisharp
" OmniSharp won't work without this setting
filetype plugin on

"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"

"Set the type lookup function to use the preview window instead of the status line
"let g:OmniSharp_typeLookupInPreview = 1

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch
"Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

"Super tab settings
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests. 
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
" Builds can run asynchronously with vim-dispatch installed
"nnoremap <F5> :wa!<cr>:OmniSharpBuildAsync<cr>

"The following commands are contextual, based on the current cursor position.

nnoremap <F12> :OmniSharpGotoDefinition<cr>
nnoremap gd :OmniSharpGotoDefinition<cr>
nnoremap <leader>fi :OmniSharpFindImplementations<cr>
nnoremap <leader>ft :OmniSharpFindType<cr>
nnoremap <leader>fs :OmniSharpFindSymbol<cr>
nnoremap <leader>fu :OmniSharpFindUsages<cr>
nnoremap <leader>fm :OmniSharpFindMembersInBuffer<cr>
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
nnoremap <leader>dc :OmniSharpDocumentation<cr>
"show type information automatically when the cursor stops moving
autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
set updatetime=500
set cmdheight=2
"I find contextual code actions so useful that I have it mapped to the spacebar
nnoremap <space> :OmniSharpGetCodeActions<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>      
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>
" Automatically add new cs files to the nearest project on save
autocmd BufWritePost *.cs call OmniSharp#AddToProject()
" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

let g:Omnisharp_start_server=0
let g:Omnisharp_stop_server=0

" ctrlp
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:12'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX

" make status line always show for airline
set ls=2

" syntastic: C++11 support
let g:syntastic_cpp_compiler_options = ' -std=c++11'
" syntastic: C++11 support (clang)
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
"
runtime! macros/matchit.vim

" airline
let g:airline#extensions#tabline#enabled = 1

set hls

" some custom commands/macros for Ag
command! -nargs=+ Agweb :Ag -G '.*\.js$|.*\.ts$|.*\.html$' <args>
command! -nargs=+ Agcs :Ag -G '.*\.cs$' <args>

" UntiSnips
" <tab> is already used by YCM
let g:UltiSnipsExpandTrigger="<c-j>"

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
