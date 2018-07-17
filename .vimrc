set number

" Set up tab stops
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

" Save .swp files to a temp dir.  Note:  Won't create lock for multiple users
set directory^=$HOME/.vim/tmp//

" Cycle through buffers with tab
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Move lines up or down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Access and read vim config file.
nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

" Auto close certain delimiters.
" ino " ""<left>
" ino ' ''<left>
" ino ( ()<left>
" ino [ []<left>
" ino { {}<left>
" ino {<CR> {<CR>}<ESC>O
" ino {;<CR> {<CR>};<ESC>O
" ino {,<CR> {<CR>};<ESC>O

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'derekwyatt/vim-scala'
Plug 'ekalinin/dockerfile.vim'
" Plug 'scrooloose/syntastic'
call plug#end()

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

noremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git\|vendor\|jspm_config\|build\|bin\|stage'
