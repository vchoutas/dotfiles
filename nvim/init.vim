" Download Vim-Plug plugin manager if not found.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/bundle')

" Auto-Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer'}
" Syntax checking
Plug 'neomake/neomake'
Plug 'nvie/vim-flake8'
" Track the engine.
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Tag-related Plugins
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
" Comment support
Plug 'scrooloose/nerdcommenter'
" Julia support
Plug 'JuliaEditorSupport/julia-vim'
" Status line enhancement
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'edkolev/tmuxline.vim'
" Enable f,F,t,T to wrap over lines
Plug 'dahu/vim-fanfingtastic'
" Motion Plugins
Plug 'easymotion/vim-easymotion'
" Vim persistent editing
Plug 'kopischke/vim-stay' " https://github.com/kopischke/vim-stay
Plug 'tpope/vim-fugitive' "https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-surround'
Plug 'taketwo/vim-ros' "https://github.com/taketwo/vim-ros
Plug 'thaerkh/vim-indentguides'  " https://github.com/thaerkh/vim-indentguides
" Navigation helper
Plug 'scrooloose/nerdtree' "https://github.com/scrooloose/nerdtree
" Git Status flags for NerdTree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Search Matches highlighting
Plug 'haya14busa/incsearch.vim'
Plug 'mhinz/vim-startify'
Plug 'xolox/vim-misc'
" Helper for remote editing
Plug 'zenbro/mirror.vim'
" View git diff on vim
Plug 'airblade/vim-gitgutter'
" Track the engine.
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Raimondi/delimitMate'

"## LaTeX Plugin Support ##"
" Latex Support plugin for Vim
Plug 'lervag/vimtex'

Plug 'ryanoasis/vim-devicons'
" Markdown preview
Plug 'JamshedVesuna/vim-markdown-preview'

call plug#end()

" Enable indent loading for specific file types
filetype plugin indent on

if !has('nvim')
  set encoding=utf-8
endif

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

set backspace=indent,eol,start

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Complete till longest common string and list all matches
set wildmode=longest,list

" Open NERDTree when staring neovim
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

" Displays line numbers
set number
set lazyredraw

" Do not save backup files
set nobackup
set nowritebackup
set noswapfile

" Copy Indent from previous line
set autoindent
filetype indent on

" Enable syntax highlighting
syntax on

" Width of line
set textwidth=80
" Use the appropriate number of spaces to insert a <Tab>
set expandtab
" Use 4 spaces when pressing <<, >>, ==
set shiftwidth=4
set tabstop=8
" Set the number of spaces for tabs
set softtabstop=4
" Enable modelines for files
set modeline
" Show the line and column number of the cursor position, separated by a
" comma.
set ruler

set conceallevel=0

" Custom colors for highlighting the position of the error/warning
augroup my_neomake_highlights
    au!
    autocmd ColorScheme *
                \ hi link NeomakeError GruvboxRed |
                \ hi link NeomakeWarning GruvboxOrangeBold |
                \ hi link NeomakeInfo GruvboxGreen |
augroup END

set background=dark
" Set up the color scheme
colorscheme gruvbox

function! s:HLGroup(group, fg, bg)
    let fg = a:fg
    let bg = a:bg
    let histring = [ 'hi', a:group,
                \  'ctermfg=' . fg,
                \ 'ctermbg=' . bg,
                \ ]
  execute join(histring, ' ')
endfunction

let s:ColumnColor = neomake#utils#GetHighlight('SignColumn', 'bg')
let s:GruvboxRed = neomake#utils#GetHighlight('GruvboxRed', 'fg')
let s:GruvboxOrange = neomake#utils#GetHighlight('GruvboxOrange', 'fg')
call s:HLGroup('NeomakeErrorSign', s:GruvboxRed, s:ColumnColor)
call s:HLGroup('NeomakeWarningSign', s:GruvboxOrange, s:ColumnColor)

" Highlight current line
set cursorline
" Set the current line to bold and black background
hi CursorLine cterm=bold ctermbg=0

" Highlight extra whitespaces with red
hi ExtraWhitespace cterm=bold term=bold ctermbg=9
hi SpellBad term=bold cterm=bold ctermbg=9
hi SpellCap term=bold cterm=bold ctermbg=28

" Enable color column only in python files
autocmd BufNewFile,BufRead *.py setlocal colorcolumn=80

" PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" When using :split put the window below the current one
set splitbelow
" When using :vsplit put the window to the right of the current one
set splitright
" show file in titlebar
set title

let g:load_doxygen_syntax=1
let loaded_matchparen = 1

let g:indentguides_ignorelist = ['text']
let g:indentguides_tabchar = '|'

" Delete all trailing whitespaces on save
let g:strip_whitespace_on_save=1

" Set the airline plugin theme
let g:airline_theme = 'murmur'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#ycm#enabled = 0

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

""" Custom Key Bindings
" Press two semicolons to escape insert mode
imap ;; <Esc>

let mapleader = "<Space>"
let maplocalleader = '<Space>'
map <Space> <leader>
map <Space><Space> <leader><leader>

" Move the current line one line down in Normal mode
nnoremap <A-j> :m .+1<CR>==
" Move the current line one line up in Normal mode
nnoremap <A-k> :m .-2<CR>==
" Move the current line one line down in Insert mode
inoremap <A-j> <Esc>:m .+1<CR>==gi
" Move the current line one line up in Insert mode
inoremap <A-k> <Esc>:m .-2<CR>==gi
" Move the selected lines one line down in visual mode
vnoremap <A-j> :m '>+1<CR>gv=gv
" Move the selected lines one line up in visual mode
vnoremap <A-k> :m '<-2<CR>gv=gv

" Map Vim search commands to incsearch plugin commands
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
" Press Enter to turn off highlighting and clear any message already displayed.
nnoremap <silent> <CR> :nohlsearch<Bar>:echo<CR>

" Use Escape key to exit terminal mode
tnoremap <Esc> <C-\><C-n>

" Remap ctrl + arrow_key to move between windows
nnoremap <C-l> <c-w>l
nnoremap <C-j> <c-w>j
nnoremap <C-h> <c-w>h
nnoremap <C-k> <c-w>k

" Disable arrow keys
noremap <Up> <NOP>
noremap <C-Up> <NOP>
noremap <Down> <NOP>
noremap <C-Down> <NOP>
noremap <Left> <NOP>
noremap <C-Left> <NOP>
noremap <Right> <NOP>
noremap <C-Right> <NOP>

" Use tab to go to next buffer in normal mode
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)

" keep cursor column when using JK motion
let g:EasyMotion_startofline = 0

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

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

" Julia Configuration
let g:default_julia_version = '0.6'
" Necessary because sometime vim thinks that *.jl files are Lisp
autocmd BufRead,BufNewFile *.jl :set filetype=julia
autocmd BufRead,BufNewFile *.jl :set syntax=julia

" YouCompleteMe Options
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-o>', '<Up>']
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_keep_logfile = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \ }
nnoremap <leader>gt :YcmCompleter GoToDefinition<CR>

let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 1

" Place tagbar on top
let g:tagbar_left = 1
let g:tagbar_vertical = 10

let NERDSpaceDelims=1
let vim_markdown_preview_github=1

" NeoMake Options
" flake8: Check python source for errors
" pep8: python style checker
" vulture: finds unused code segments
let g:neomake_python_enabled_makers = ['flake8', 'pep8', 'vulture']
" let g:neomake_python_flake8_maker = { 'args': ['--ignore=E115,E266,E501'], }
let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=120', '--ignore=E115,E266'], }

" Define new signs for the following messages
" hi NeomakeErrorMsg ctermfg=GruvboxRed
let g:neomake_error_sign = {
            \ 'text': '✗',
            \ 'texthl': 'NeomakeErrorSign',
            \ }
let g:neomake_warning_sign = {
            \ 'text': '☢',
            \ 'texthl': 'NeomakeWarningSign',
            \ }

" run neomake on the current file on every write:
autocmd! BufWritePost * Neomake

" Automatically change to CWD when opening startify
let g:startify_change_to_dir = 1
let g:startify_bookmarks = ['~/workspace', '~/.zshrc', '~/.config/nvim/init.vim',
            \ '~/.tmux.conf']
" The number of MRU files to be displayed
let g:startify_files_number = 5
let g:startify_list_order = [
            \ ['   MRU Files'],
            \ 'files',
            \ ['   Current working dir MRU files'],
            \ 'dir',
            \ ['   Bookmarks:'],
            \ 'bookmarks',
            \ ['   Sessions:'],
            \ 'sessions',
            \ ['   Commands:'],
            \ 'commands',
            \ ]

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:Ultisnips_python_style="doxygen"
let g:UltiSnipsListSnippets="<c-b>"

let g:easytags_async=1

" Open the tagbar using Ctrl-t
nmap <C-t> :TagbarToggle<CR>
" NERDTree
" toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" find the current file in NERDTree
nmap <leader>f :NERDTreeFind<CR>

let NERDTreeIgnore = ['\.pyc$', '\.png$', '\.aux$', '\.lo[a-z]*$', '\.error$', '\.output$', '__pycache__']

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DoxygenToolkit_authorName="Vassilis Choutas"

" Vim mapping to edit configuration file
noremap <leader>ev :edit $MYVIMRC<CR>
noremap <leader>tv :tabedit $MYVIMRC<CR>
" Vim mapping to source configuration file
nnoremap <leader>sv :source $MYVIMRC<CR>

" Set spell check for LaTeX files
nmap <silent> <leader>sc :set spell!<CR>

" autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=el,en
" set complete+=kspell

let g:tex_flavor='latex'
