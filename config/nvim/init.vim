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
set encoding=UTF-8
set autoread

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile

set showcmd   " display incomplete command
set autowrite " automatically :write before running commands

" keep searched chunks hightlighted
set hlsearch
set updatetime=50
autocmd cursorhold * set nohlsearch
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?

" Plugins

" create symlink: ln -sf ~/dotfiles/config/nvim/init.vim  ~/.config/nvim/init.vim
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
" Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-commentary'
" Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-repeat'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " apt-get install silversearcher-ag
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
" Plug 'mxw/vim-jsx'
Plug 'neoclide/vim-jsx-improve', { 'for': 'javascript' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'andymass/vim-matchup'
Plug 'elixir-editors/vim-elixir', {'for': 'elixir'}
Plug 'c-brenn/phoenix.vim', {'for': 'elixir'}
Plug 'janko-m/vim-test'
Plug 'sheerun/vim-polyglot'
" Clojure
Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
Plug 'tpope/vim-leiningen', { 'for': 'clojure' }
Plug 'tpope/vim-classpath', { 'for': 'clojure' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'venantius/vim-eastwood', { 'for': 'clojure' }
Plug 'gfanto/fzf-lsp.nvim'
" Plug 'Valloric/YouCompleteMe' // install.py --clang-completer ERROR
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-lists',
      \ 'coc-sh',
      \ 'coc-css',
      \ 'coc-stylelint',
      \ 'coc-vimlsp',
      \ 'coc-elixir',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-jest',
      \ 'coc-solargraph',
      \ 'coc-yaml',
      \ 'coc-highlight',
      \ 'coc-snippets',
      \ 'coc-docker',
      \ 'coc-diagnostic',
      \]

call plug#end()

augroup FileTypeTetect
  autocmd!
  filetype plugin indent on
  autocmd BufEnter Makefile setlocal ts=4 sw=4 noexpandtab
augroup END

autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

""" Plugins keymaps

set rtp+=~/.fzf
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

let mapleader = "\<Space>"
let g:airline#extensions#tabline#enabled = 1
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

colorscheme gruvbox
let g:airline_theme = 'gruvbox'
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'
let g:gruvbox_color_column = 'blue'
let g:gruvbox_hls_cursor = 'blue'
" let g:gruvbox_number_column = 'bg0'
" let g:gruvbox_sign_column = 'bg1'
set background=dark
nnoremap <Leader>d :set background=dark<CR>
nnoremap <Leader>l :set background=light<CR>

nmap j gj
nmap k gk


map <C-n> :NERDTreeToggle<CR>
nmap <C-m> :NERDTreeFind<CR>
" let g:webdevicons_enable = 1
" let g:webdevicons_enable_nerdtree = 1
" let g:webdevicons_enable_airline_tabline = 1
" let g:webdevicons_enable_airline_statusline = 1
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 31
let g:NERDTreeChDirMode = 2
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeCascadeOpenSingleChildDir = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeMouseMode = 3
let g:NERDTreeShowHidden = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ "Modified"  : "●",
      \ "Staged"    : "✔",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "❗",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "~",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "❓"
      \ }
" nmap <silent> <leader><leader> :NERDTreeToggle<CR>
nnoremap <silent> <leader>b :Buffers<CR>
map <leader> <Plug>(easymotion-prefix)
map <leader>s <Plug>(easymotion-bd-f)
nmap <leader>s <Plug>(easymotion-overwin-f)

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>o :GFiles .<CR>
nnoremap <Leader>fc :Commits<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fa :Ag<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Git commit<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>df :Gdiffsplit<CR>

" nnoremap <Leader>c :let @/=""<CR>

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

" COC

let g:vista_default_executive = 'coc'
let g:coc_snippet_next = '<tab>'

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" nmap <silent> rr <Plug>(coc-rename)
" nnoremap<leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" COC

" resize split
nnoremap <silent> <Leader>7 :exe "resize " . (winheight(0) * 10/9)<CR>
nnoremap <silent> <Leader>8 :exe "resize " . (winheight(0) * 9/10)<CR>
nnoremap <silent> <Leader>9 :exe "vertical resize " . (winwidth(0) * 10/9)<CR>
nnoremap <silent> <Leader>0 :exe "vertical resize " . (winwidth(0) * 9/10)<CR>

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

" нужно для многократной замены текста при выделении, без потери данных из буфера
vmap <Leader>c "_dP
nmap <Leader>c <S-v>"_dP

" reload files tree
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

" enable yank/paste to/from system clipboard
if has("clipboard")
  set clipboard=unnamed
  if has("unnamedplus")
    set clipboard+=unnamedplus
  endif
endif
