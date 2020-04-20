syntax on "basic highlighting

set noerrorbells "sound effects when go to EOL
set tabstop=4 softtabstop=4 "tab indentation, softtabstop = spaces long
set shiftwidth=4 "shifts it over by spaces
set expandtab
set smartindent "let vim indent for me
set nowrap "no wrapping
set smartcase "case-sensitive searching
set noswapfile "since we are using undodir and undofile
set nobackup
set undodir=~/.vim/undodir "location of undo dir. Needs to create this folder
set undofile "file per file undo
set incsearch "highlight results while typing keywords
set laststatus=2
set cursorline

set nocompatible
set vb t_vb=        "no visual bell & flash

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" Column width, color
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" ---------------------
" PLUGINS
" ---------------------
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'https://github.com/zefei/simple-dark' "theme
Plug 'kien/ctrlp.vim' "file finding
Plug 'mbbill/undotree' 
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdtree' "file explorer
Plug 'itchyny/lightline.vim' "status bar
Plug 'mhinz/vim-startify' "start up page
Plug 'https://github.com/tyru/open-browser.vim' "open URI with browser
Plug 'https://github.com/tpope/vim-surround' "quoting & parenthesizing

Plug 'shawncplus/phpcomplete.vim' "Improved PHP omni-completion
Plug 'StanAngeloff/php.vim' "php syntax
Plug 'stephpy/vim-php-cs-fixer' "php formatting
Plug 'dsawardekar/wordpress.vim' "For WP Dev


" Initialize plugin system
call plug#end()

" ---------------------
" / PLUGINS
" ---------------------
"
colorscheme simple-dark
set background=dark

"=====================
"   Custom Remapping
"=====================
nnoremap <Space> <nop>
let mapleader = " " "space leader key to do special actions
"leaderkey + w saves the file"
noremap <leader>w :w<CR>
noremap <leader>q :q<CR>
noremap <leader>r :source %<CR>

" Map NERDTree to Ctrl + n
map <C-n> :NERDTreeToggle<CR>

"NORMAL MODE -----
" don't use arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"INSERT MODE -----
inoremap jj <Esc>
inoremap kk <Esc>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"don't use arrows keys even in insert mode
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

"=====================
"  / Custom Remapping
"=====================

" Closes NERDTree explorer if it is the only opened window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open a NERDTree automatically when vim starts up if no files were specified
" FOLLOWING LINES ARE COMMENT OUT FOR START UP PAGE
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
