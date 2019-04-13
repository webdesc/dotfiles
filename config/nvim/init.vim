setglobal nocompatible
setglobal pastetoggle=<F4>
setglobal smartcase
setglobal incsearch
setglobal tags=./tags;
setglobal include=
setglobal path=.,,

syntax on
set number
set hidden
set showtabline=0
set nopaste
set expandtab
set softtabstop=2
set shiftwidth=2
set cursorline

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile

set showcmd   " display incomplete command
set autowrite " automatically :write before running commands

" Plugins

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-repeat'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " apt-get install silversearcher-ag
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'neoclide/vim-jsx-improve', { 'for': 'javascript' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
" Plug 'Valloric/YouCompleteMe' // install.py --clang-completer ERROR
Plug 'elixir-editors/vim-elixir', {'for': 'elixir'}
Plug 'c-brenn/phoenix.vim', {'for': 'elixir'}
Plug 'janko-m/vim-test'

call plug#end()

""" Plugins keymaps

set rtp+=~/.fzf
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

let mapleader = "\<Space>"
let g:airline#extensions#tabline#enabled = 1
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

let g:airline_theme = 'gruvbox'
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox

nmap j gj
nmap k gk

map <C-n> :NERDTreeToggle<CR>
nmap <C-m> :NERDTreeFind<CR>
" nmap <silent> <leader><leader> :NERDTreeToggle<CR>
nnoremap <silent> <leader>b :Buffers<CR>
map <leader> <Plug>(easymotion-prefix)

nnoremap <Leader>w :w<CR>
nnoremap <Leader>o :GFiles .<CR>
nnoremap <Leader>fc :Commits<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fa :Ag<CR>

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" syntastic setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:stntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Open new split for C+hjkl, if split doesnt exist
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
    if (t:curwin == winnr())
      if (match(a:key,'[jk]'))
        wincmd v
      else
        wincmd s
      endif
      exec "wincmd ".a:key
    endif
  endfunction
