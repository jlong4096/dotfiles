set number

" Set up tab stops
set tabstop=2
set shiftwidth=2
set expandtab

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
nnoremap <leader>ev :e $HOME/.vimrc<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'ekalinin/dockerfile.vim'
Plug 'tpope/vim-haml'
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

hi DiffAdd ctermfg=black ctermbg=green
hi DiffChange ctermfg=black ctermbg=yellow
hi DiffText ctermfg=black ctermbg=yellow
hi DiffDelete ctermfg=white ctermbg=red
