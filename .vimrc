augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set number norelativenumber
augroup END

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
" nnoremap <C-j> :m .+1<CR>==
" nnoremap <C-k> :m .-2<CR>==
" inoremap <C-j> <ESC>:m .+1<CR>==gi
" inoremap <C-k> <ESC>:m .-2<CR>==gi
" vnoremap <C-j> :m '>+1<CR>gv=gv
" vnoremap <C-k> :m '<-2<CR>gv=gv

" More natural windows
set splitbelow
set splitright
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h


" Access and read vim config file.
nnoremap <leader>ev :e $HOME/.vimrc<CR>
nnoremap <leader>sv :so $MYVIMRC<CR>

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-commentary'
" Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'
Plug 'tomtom/tcomment_vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

let g:polyglot_disabled=['vue']
let g:vue_pre_processors=['scss']

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

noremap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git\|vendor\|jspm_config\|build\|bin\|dist\|stage'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['package.json']
let g:ctrlp_show_hidden = 1

hi DiffAdd ctermfg=black ctermbg=green
hi DiffChange ctermfg=black ctermbg=yellow
hi DiffText ctermfg=black ctermbg=yellow
hi DiffDelete ctermfg=white ctermbg=red

let g:prettier#exec_cmd_async = 1
" let g:prettier#quickfix_enabled = 0
" let g:prettier#autoformat = 0
" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

set tags=tags

autocmd BufNewFile *.vue 0r ~/.vim/templates/skeleton.vue
