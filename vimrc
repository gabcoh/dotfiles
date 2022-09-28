" mudot destination: ~--> '~/.vimrc'
" vim: set foldmethod=marker
"Welcome to Gabe's nVimrc
"|   | _____
"|   |   |
"|---|   |  
"|   |   |
"|   | __|__

"{{{Manage Vundle 
" set nocompatible              " be iMproved, required
" filetype off                  " required
" 
" " set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin('~/.vim/plugins')
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin(~/some/path/here)
" " let Vundle manage Vundle, required
" Plugin 'gmarik/vundle'
" "airline information bar
" Plugin 'bling/vim-airline'
" "indent level display
" Plugin 'yggdroot/indentline'
" "awesome motions
" Plugin 'easymotion/vim-easymotion'
" "Nerdtree 
" Plugin 'scrooloose/nerdtree'
" "colorschemes
" Plugin 'flazz/vim-colorschemes'
" "glsl syntax
" Plugin 'glsl.vim'
" "go lang pugin
" "Plugin 'fatih/vim-go'
" "startup
" Plugin 'mhinz/vim-startify'
" "closure plugin
" Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'leafgarland/typescript-vim'
" 
" Plugin 'junegunn/fzf'
" Plugin 'junegunn/fzf.vim'
" 
" Plugin 'lervag/vimtex'
" 
" Plugin 'dhruvasagar/vim-table-mode'
" 
" Plugin 'jceb/vim-orgmode'
" 
" "util snips
" " Track the engine.
" Plugin 'SirVer/ultisnips'
" 
" call vundle#end()            " required
" filetype plugin indent on    " required

"other plugins
packloadall
silent! helptags ALL
"}}}

" {{{ Settings

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetDirectories=["UtilSnips"]

" i hate this
set conceallevel=0
"get proper folding in vimrc
set foldmethod=marker

"Make font size readable in gvim
set guifont=Monospace\ 14

"vimtex viewr
let g:vimtex_view_method = 'mupdf'

"Set some Configuration Settings
set number numberwidth=1
set relativenumber

set wrap
set sidescroll=5
set listchars+=precedes:<,extends:>

"get backspac to work
set backspace=2

"convert tab to 4 spaces
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"enables airline
set laststatus=2


"set up proper colors
syntax enable
set background=light
" colorscheme PaperColor 
set t_Co=256

set guioptions=e
" }}}

" {{{ General key mappings
"set leader to ,
let mapleader=","
"set localleader to \
let maplocalleader="\\"


"Key Remappings
"save with w
nnoremap W :w<CR>
"space to select current word
nnoremap <space> viw

"- to move line up
nnoremap - "myy"_ddkk"mp
"_ move line down
nnoremap _ "myy"_dd"mp

"change current word to uppercase
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU

"open vimrc in split and 
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

"quote current word with "
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
"quote current word with '
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

"quote current visual selection
vnoremap <leader>' <esc>i'<esc>`>i'<esc>gv
vnoremap <leader>" <esc>i"<esc>`>i"<esc>gv

"exit insert mode with 
inoremap fd <esc>
inoremap <esc> <nop>

"insert new line above or below curser
nnoremap <leader>o o<esc>k
nnoremap <leader>O O<esc>j
"deletes content of line but leaves newline
nnoremap <leader>dd ddko<esc>
"quit split
nnoremap <leader>q :q<cr>
"open NERDTree
nnoremap <leader>nt :NERDTree<cr>
"set paste mode and nopaste mode
nnoremap <leader>p :set paste<cr>
nnoremap <leader>np :set nopaste<cr>

"select inside next or last parentheses
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F(vi(<cr>
"select around next or last parentheses
onoremap an( :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F(va(<cr>
"select inside next or last { 
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F{vi{<cr>
"select around next or last {
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap al{ :<c-u>normal! F{va{<cr>
" }}}

" {{{ RainbowParens setup
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
" }}}

" {{{ notatoinal-fzf Setup
nnoremap <leader>nv :Files ~/Nextcloud/notes/org<cr>

fun! Metadata()
    exe "g/date: /s/date: /date: \"". strftime("%d %m %Y") . "\""
    exe "g/title: /s/title: /title: \"". expand("%:t:r") . "\""
endfun
fun! NotesSettings()
    setlocal conceallevel=0
    setlocal tw=80
    setlocal fo=aw2tq
endfun
augroup notes
    autocmd!
    autocmd BufNewFile */notes/*.md 0r ~/Documents/notes/template.md
    autocmd BufNewFile */notes/*.md ks|call Metadata()|'s
    "autocmd BufNewFile,BufRead */notes/*.md ks|call NotesSettings()|'s
augroup END
" }}}

" {{{ Markdown settings
autocmd BufNewFile,BufReadPre *.md :setlocal spell
autocmd BufNewFile,BufReadPre *.md :setlocal conceallevel=0
autocmd BufNewFile,BufReadPre *.md :setlocal tw=80
" }}}
"
" {{{ Latex settings
autocmd BufNewFile,BufReadPre *.tex :setlocal spell
autocmd BufNewFile,BufReadPre *.tex :setlocal tw=80
" }}}
"
" {{{ Smali settings
au BufRead,BufNewFile *.smali set filetype=smali
" }}}
