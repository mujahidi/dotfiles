syntax enable
set tabstop=4
set expandtab
set number
filetype indent on
set autoindent

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Add plugins here
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on

" Auto start NERDTree when vim is opened
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Remap code completion to Ctrl+Space
:inoremap <C-@> <C-n>

" Map NERDTree to Ctrl + n
map <C-n> :NERDTreeToggle<CR>

" Closes NERDTree explorer if it is the only opened window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Recommended Settings for new users of syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" don't use arrowkeys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" really, just don't
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" esc key mapped to jj and kk
map! jj <Esc>
map! kk <Esc>

" reversed 'j' and 'k' key mappings
:nnoremap j k
:nnoremap k j

" Map h,j,k,l with C- in insert mode
:inoremap <C-j> <Up>
:inoremap <C-k> <Down>
:inoremap <C-h> <Left>
:inoremap <C-l> <Right>
