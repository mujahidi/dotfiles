syntax on

set encoding=UTF-8
set nocompatible "use VIM settings rather than VI
filetype off
filetype plugin on

set cursorline
set exrc "will automatically source '.vimrc' inside a project when doing 'vim .'
set relativenumber
set nu
set nohlsearch
set hidden "Keeps background buffers active
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set showmatch
set mat=2
set scrolloff=8 "starts scrolling when bottom or top is 8 rows away
set colorcolumn=80
set signcolumn=yes

set cmdheight=2 " Give more space for displaying messages.

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

call plug#begin('~/.vim/plugged')
"Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'yegappan/taglist'
call plug#end()


if has('termguicolors')
    set termguicolors
endif

set background=dark
colorscheme codedark

let g:airline_theme = 'codedark'

let mapleader = " " "space leader key

noremap <leader>w :w<CR>
noremap <leader>q :q<CR>

" Switch between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>sv :wincmd v <bar> :wincmd l<CR> "Split current window vertically

" Buffers Navigation
nnoremap <leader>bl :buffers<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprev<CR>
nnoremap <leader>bd :bd<CR>

" bind arrow keys to pan resizing
nnoremap <Up> :resize -5<CR>
nnoremap <Down> :resize +5<CR>
nnoremap <Left> :vertical resize +5<CR>
nnoremap <Right> :vertical resize -5<CR>

nnoremap <leader>u :UndotreeToggle<CR>

noremap <leader>t :Tlist<CR>

" COC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"COC Config
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-phpls',
    \ 'coc-prettier',
    \ 'coc-json',
    \ ]
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
let g:coc_disable_startup_warning = 1 "disable coc warning

" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-M> :NERDTreeFind<CR>
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

"Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = ','
autocmd FileType html,css,php EmmetInstall

"Tag Along
let g:tagalong_verbose = 1

"NERDCommenter
nmap ++ <plug>NERDCommenterToggle
"nmap ++ <plug>NERDCommenterToggle

"Insert Mode Navigation
inoremap jj <Esc>
inoremap kk <Esc>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup WhiteSpaceTrimListener
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END
