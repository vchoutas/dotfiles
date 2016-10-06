" Download Vim-Plug plugin manager if not found.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


call plug#begin('~/.config/nvim/bundle')

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer'}
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'for': ['lua']}
" Plug 'Shougo/echodoc'

Plug 'rdnetto/YCM-Generator'

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'nvie/vim-flake8'
" Plug 'hdima/python-syntax'
Plug 'bling/vim-airline'
" Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'zenorocha/dracula-theme', {'rtp': 'vim/'}

" Tag-related Plugins
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}
" Motion Plugins
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-fugitive' "https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-surround'
Plug 'taketwo/vim-ros' "https://github.com/taketwo/vim-ros
Plug 'Yggdroot/indentLine' "https://github.com/Yggdroot/indentLine
Plug 'scrooloose/nerdtree' "https://github.com/scrooloose/nerdtree

" Git Status flags for NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" Search Matches highlighting
Plug 'haya14busa/incsearch.vim'

Plug 'mhinz/vim-startify'
Plug 'xolox/vim-misc'

" Lua support plugins
" Plug 'xolox/vim-lua-ftplugin'
" Plug 'lua-support'

" Adapts gui colorschemes to terminal
" Plug 'KevinGoodsell/vim-csexact'
" Airline bar theme
Plug 'paranoida/vim-airlineish'
" View git diff on vim
Plug 'airblade/vim-gitgutter'
" Track the engine.
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace'
" Easy switching between header and source file
Plug 'vim-scripts/a.vim'
Plug 'Raimondi/delimitMate'


"## LaTeX Plugin Support ##"
" Latex Support plugin for Vim
Plug 'LaTeX-Box-Team/LaTeX-Box'

" Green Language Spelling
Plug 'bserem/vim-greek-spell', {'for': 'tex'}

" Autoswitch on ESC back to English KeyMap in order to insert Commands
Plug 'lyokha/vim-xkbswitch', {'for': 'tex'}

Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/DoxygenToolkit.vim'

Plug 'JuliaLang/julia-vim'

call plug#end()

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

if !has('nvim')
  set encoding=utf-8
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


if has('unnamedplus')
  set clipboard=unnamedplus,unnamed
else
  set clipboard+=unnamed
endif

let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Displays line numbers
set number
set lazyredraw

" Copy Indent from previous line
set autoindent
set smartindent

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

syntax on

set textwidth=100
set colorcolumn=120
set expandtab
set shiftwidth=2
set softtabstop=2
set ruler

set title " show file in titlebar

" let base16colorspace=256
set background=dark
" colorscheme blacklight
colorscheme gruvbox
" colorscheme pablo

" highlight Normal cterm=bold
" highlight Comment term=bold cterm=bold
" highlight Function term=bold cterm=bold
" highlight Identifier term=bold cterm=bold ctermfg=220
" hi Pmenu NONE
hi Pmenu term=bold cterm=bold ctermfg=White ctermbg=Blue
hi PmenuSel term=bold cterm=bold ctermfg=Black
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
hi CursorLine cterm=bold ctermbg=0

hi Visual term=bold cterm=bold ctermbg=8
hi ExtraWhitespace cterm=bold term=bold ctermbg=9
hi SpellBad term=bold cterm=bold ctermbg=9
hi SpellCap term=bold cterm=bold ctermbg=28

let g:load_doxygen_syntax=1
let loaded_matchparen = 1

let g:indentLine_char = '|'
let g:indentLine_color_term = 239

" Delete all trailing whitespaces on save
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

" Map Vim search commands to incsearch plugin commands
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Use Escape key to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Remap ctrl + arrow_key to move between windows
nnoremap <C-Right> <c-w>l
nnoremap <C-Down> <c-w>j
nnoremap <C-Left> <c-w>h
nnoremap <C-Up> <c-w>k
" Ctrl-y to copy in + buffer from visual mode
" vmap <C-y> "+y

"Ctrl-p to paste from the + register in cmd mode
" map <C-p> "+p

" Workaround to enable clipboard yank and paste
function! ClipboardYank()
  call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
  let @@ = system('xclip -o -selection clipboard')
endfunction

vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p

onoremap <silent> y y:call ClipboardYank()<cr>
onoremap <silent> d d:call ClipboardYank()<cr>

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


" YouCompleteMe Options
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_keep_logfile = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 0

" let g:lua_compiler_name = '/home/vchoutas/torch/install/bin/luajit'

let g:jedi#auto_initialization = 0
let g:jedi#completions_enabled = 1

" Place tagbar on top
let g:tagbar_left = 1
let g:tagbar_vertical = 10

let NERDSpaceDelims=1

" Syntastic Options
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_lua_checkers = ["luac", "luacheck"]
let g:syntastic_lua_luacheck_args = "--no-unused-args"

let g:syntastic_python_python_exec = '/usr/bin/python2/'
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = '☢'
let g:syntastic_style_error_symbol = '✗✗'

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


" Vim mapping to edit configuration file
noremap <leader>ev :split $MYVIMRC<CR>
" Vim mapping to source configuration file
nnoremap <leader>sv :source $MYVIMRC<CR>

" Set spell check for LaTeX files
nmap <silent> <leader>sc :set spell!<CR>

" autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=el,en
" set complete+=kspell

let g:LatexBox_quickfix=4
let g:LatexBox_split_type="new"
let g:LatexBox_latexmk_async=1

let g:tex_flavor='latex'
