set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nvie/vim-flake8'
Plugin 'hdima/python-syntax'
Plugin 'bling/vim-airline'
" Colorschemes
Plugin 'flazz/vim-colorschemes'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}

Plugin 'tpope/vim-fugitive' "https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-surround'
Plugin 'taketwo/vim-ros' "https://github.com/taketwo/vim-ros
Plugin 'Yggdroot/indentLine' "https://github.com/Yggdroot/indentLine
Plugin 'scrooloose/nerdtree' "https://github.com/scrooloose/nerdtree

" Git Status flags for NerdTree
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'mhinz/vim-startify'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'rdnetto/YCM-Generator'
" Adapts gui colorschemes to terminal
" Plugin 'KevinGoodsell/vim-csexact'
" Airline bar theme
Plugin 'paranoida/vim-airlineish'
" View git diff on vim
Plugin 'airblade/vim-gitgutter'
" Track the engine.
Plugin 'SirVer/ultisnips'
Plugin 'ntpeters/vim-better-whitespace'
" Easy switching between header and source file
Plugin 'vim-scripts/a.vim'
Plugin 'Raimondi/delimitMate'
" Latex Support plugin for Vim
Plugin 'LaTeX-Box-Team/LaTeX-Box'

Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-scripts/DoxygenToolkit.vim'

Plugin 'JuliaLang/julia-vim'

" Autoswitch on ESC back to English KeyMap in order to insert Commands
Plugin 'lyokha/vim-xkbswitch'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif


set backspace=indent,eol,start

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


set wildmode=longest,list


autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ |   NERDTree
                \ |   wincmd w
                \ | endif



filetype plugin on
if has('unnamedplus')
  set clipboard=unnamedplus,unnamed
else
  set clipboard+=unnamed
endif
set number


" Copy Indent from previous line
set autoindent
set smartindent

set background=dark

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

syntax on

set colorcolumn=120
set expandtab
set shiftwidth=2
set softtabstop=2
set ruler

set title " show file in titlebar
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" colorscheme impactjs
" colorscheme billw
" colorscheme darkBlue
colorscheme blacklight
" colorscheme pablo
" colorscheme neverland-darker

" highlight Normal cterm=bold
" highlight Comment term=bold cterm=bold
" highlight Function term=bold cterm=bold
" highlight Identifier term=bold cterm=bold ctermfg=220
" hi Pmenu NONE
hi Pmenu term=bold cterm=bold ctermfg=16 ctermbg=82
hi PmenuSel term=bold cterm=bold ctermfg=16 ctermbg=8
" highlight Include term=bold cterm=bold
" highlight Type term=bold cterm=bold
" highlight cppSTLnamespace cterm=bold ctermfg=201
" highlight Statement cterm=bold ctermfg=163
" highlight cppSTLconstant cterm=bold ctermfg=63
" highlight cppSTLtype cterm=bold ctermfg=27
" highlight String cterm=bold ctermfg=161

" Highlight current line
set cursorline
" Set the current line to bold and black background
hi CursorLine cterm=bold ctermbg=16

hi Visual term=bold cterm=bold ctermbg=8
hi ExtraWhitespace cterm=bold term=bold ctermbg=9
hi SpellBad term=bold cterm=bold ctermbg=9
hi SpellCap term=bold cterm=bold ctermbg=28

let g:load_doxygen_syntax=1
let loaded_matchparen = 1

let g:indentLine_char = '|'
let g:indentLine_color_term = 239

let g:strip_whitespace_on_save=1

let g:python_no_builtin_highlight = 1
"Highlight Class Scope
let g:cpp_class_scope_highlight = 1
" Set the airline plugin theme
let g:airline_theme = 'airlineish'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#syntastic#enabled = 1


let g:airline_detect_modified=1
let g:airline_detect_paste=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

set fillchars+=stl:\ ,stlnc:\


" Always open Vim Airline Plugin
set noshowmode
set laststatus=2
set showcmd

set nobackup
set nowritebackup
set noswapfile

set incsearch

" Remap ctrl + arrow_key to move between windows
nnoremap <C-Right> <c-w>l
nnoremap <C-Down> <c-w>j
nnoremap <C-Left> <c-w>h
nnoremap <C-Up> <c-w>k
" Ctrl-y to copy in + buffer from visual mode
vmap <C-y> "+y

"Ctrl-p to paste from the + register in cmd mode
map <C-p> "+p

" Cuda filetype
" au BufNewFile,BufRead *.cu set filetype=cuda
autocmd BufRead,BufNewFile *.cu set filetype=cpp
autocmd BufRead,BufNewFile *.cuh set filetype=cpp
" au BufNewFile,BufRead *.cuh set filetype=cuda.cpp
" au BufNewFile,BufRead *.cu set ft=cuda.cpp
" au Syntax cuda
      " \ if (exists('b:load_doxygen_syntax') && b:load_doxygen_syntax)
      " \       || (exists('g:load_doxygen_syntax') && g:load_doxygen_syntax)
      " \   | runtime! syntax/doxygen.vim
      " \ | endif

let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_keep_logfile = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 0

let g:jedi#auto_initialization = 0

let g:tagbar_left = 1
let g:tagbar_vertical = 10

let NERDSpaceDelims=1

let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 0
let g:syntastic_python_checkers = ['pep8', 'flake8']
let g:syntastic_python_python_exec = '/usr/bin/python2/'
let g:syntastic_error_symbol = "✗"
let g:syntastic_style_error_symbol = '✗✗'
let g:syntastic_style_warning_symbol = "⚠⚠"

let g:startify_change_to_dir = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:Ultisnips_python_style="doxygen"
let g:UltiSnipsListSnippets="<c-b>"

nmap <C-t> :TagbarToggle<CR>
" NERDTree
" toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" find the current file in NERDTree
nmap <leader>f :NERDTreeFind<CR>

set encoding=utf-8
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ Plus\ Font\ Awesome\ Plus\ Pomicons


let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DoxygenToolkit_authorName="Vassilis Choutas"
" Remove TeX Preview in vim buffer
let g:tex_conceal = ""

" Greek Keyboard Support for Vim
set langmap=ΑA,ΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz

" Enable xkb switch Plugin
let g:XkbSwitchEnabled = 1

" Disable XkbSwitch for nerdtree
let g:XkbSwitchSkipFt = [ 'nerdtree' ]
