augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber
  autocmd BufLeave,FocusLost,InsertEnter * set number norelativenumber
augroup END

" Set up tab stops
set tabstop=2
set shiftwidth=2
set expandtab
" autocmd Filetype go setlocal tabstop=4 shiftwidth=4
" au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au Filetype go setlocal noet ts=4 sw=4 sts=4
au Filetype proto setlocal noet ts=2 sw=2 sts=2

" Save .swp files to a temp dir.  Note:  Won't create lock for multiple users
set directory^=$HOME/.vim/tmp//
" set clipboard=unnamedplus
set foldmethod=manual
set tags=tags

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

let g:polyglot_disabled=['vue', 'go']
let g:vue_pre_processors=['scss', 'ts']
let html_no_rendering=1 " vue files with self-closing tags cause syntax highlighting to fail

call plug#begin('~/.vim/plugged')
" IDE plugins
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'noahfrederick/vim-noctu'
Plug 'whiteinge/diffconflicts'	" See readme for merge.tool instructions
" Plug 'tpope/vim-fugitive'
" Editor plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tomtom/tcomment_vim'
Plug 'mileszs/ack.vim'
Plug 'moll/vim-bbye'
Plug 'AndrewRadev/linediff.vim'
Plug 'romainl/vim-qf'
" Plug 'svermeulen/vim-easyclip'
" Language plugins
Plug 'posva/vim-vue'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'sheerun/vim-polyglot' " Kept at end to not conflict with other languages
call plug#end()

let g:deoplete#enable_at_startup = 0
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

nmap <F6> :GoTest<CR>
nmap <F7> :GoCoverageToggle<CR>
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_highlight_diagnostic_errors = 0
let g:go_highlight_diagnostic_warnings = 0
let g:go_metalinter_enabled = ['deadcode', 'errcheck', 'gosimple', 'govet', 'ineffassign', 'staticcheck', 'structcheck', 'typecheck', 'unused', 'varcheck']
let g:go_metalinter_command="golangci-lint"

noremap <C-n> :NERDTreeToggle<CR>
noremap <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|vendor|jspm_config|build|bin|dist|stage|coverage)|(\.(swp|ico|git|svn|DS_Store))$'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_root_markers = ['package.json', 'go.mod']
let g:ctrlp_show_hidden = 1

" nnoremap gm m
" nmap M <Plug>MoveMotionEndOfLinePlug

" hi DiffAdd ctermfg=black ctermbg=green
" hi DiffChange ctermfg=black ctermbg=yellow
" hi DiffText ctermfg=black ctermbg=yellow
" hi DiffDelete ctermfg=white ctermbg=red
"
let g:prettier#exec_cmd_async = 1
" let g:prettier#quickfix_enabled = 0
" let g:prettier#autoformat = 0
" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

autocmd BufNewFile *.vue 0r $HOME/.vim/templates/skeleton.vue
nnoremap <leader>vue :. !cat $HOME/.vim/templates/skeleton.vue<CR>

if executable('ag')
	let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_vue_checkers = ['eslint']
" nnoremap <leader>l :SyntasticCheck<CR>

colorscheme dim
