call plug#begin('~/.vim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" (Completion plugin option 1)
"Plug 'roxma/nvim-completion-manager'
" (Completion plugin option 2)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'NLKNguyen/papercolor-theme'
Plug 'majutsushi/tagbar'
Plug 'rbgrouleff/bclose.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'

call plug#end()

let mapleader = ','


"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap <silent>\d :NERDTreeToggle<cr>

" Files to ignore
let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^\.DS_Store$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$'
\]

" Close vim if NERDTree is the only opened window.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files by default.
let NERDTreeShowHidden = 1

" Allow NERDTree to change session root.
let g:NERDTreeChDirMode = 2

"----------------------------------------------
" Plugin: vim-airline/vim-airline
"----------------------------------------------
" Show status bar by default.
set laststatus=2

" Enable top tabline.
let g:airline#extensions#tabline#enabled = 1

" Disable showing tabs in the tabline. This will ensure that the buffers are
" what is shown in the tabline at all times.
let g:airline#extensions#tabline#show_tabs = 0

" Enable powerline fonts.
let g:airline_powerline_fonts = 0

" Explicitly define some symbols that did not work well for me in Linux.
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '<U+E0A0>'
let g:airline_symbols.maxlinenr = '<U+E0A1>'

" Plugin: 'ctrlpvim/ctrlp.vim'
"----------------------------------------------
" Note: We are not using CtrlP much in this configuration. But vim-go depend on
" it to run GoDecls(Dir).

" Disable the CtrlP mapping, since we want to use FZF instead for <c-p>.
let g:ctrlp_map = ''

"----------------------------------------------
" Plugin: 'junegunn/fzf.vim'
"----------------------------------------------
nnoremap <c-p> :FZF<cr>

set conceallevel=2
set concealcursor=niv

" Plugin: deoplete
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" deoplete + neosnippet + autopairs changes 
let g:deoplete#auto_complete_start_length = 1 
let g:deoplete#enable_at_startup = 1 
let g:deoplete#enable_smart_case = 1 
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>") 
"imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
"imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"

let g:LanguageClient_serverCommands = {
\ 'cpp': ['/home/giant/cquery/build/release/bin/cquery', '--language-server', '--log-file=/tmp/cq.log']
\ }
let g:LanguageClient_loadSettings = 1
" 暂时关闭语法检测
"let g:LanguageClient_diagnosticsEnable = 0
let g:LanguageClient_settingsPath='/home/giant/.vim/settings.json'


let g:neosnippet#snippets_directory='~/.vim/plugged/neosnippet-snippets/neosnippets/'

"----------------------------------------------
" Plugin: mileszs/ack.vim
"----------------------------------------------
" Open ack
nnoremap <leader>a :Ack! <C-R><C-W><space>
nnoremap <leader>gg :Ack! --type=cpp <C-R><C-W><space>

" Rust tagbar
 let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
    \}


set colorcolumn=81
set cursorline
set expandtab
set number
set relativenumber
set softtabstop=0 noexpandtab
set tabstop=4
set shiftwidth=4
set textwidth=80
set title
set updatetime=100
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation

set background=dark
colorscheme PaperColor
nnoremap <F3> :TagbarToggle<cr>

noremap <tab>h <c-w>h
noremap <tab>j <c-w>j
noremap <tab>k <c-w>k
noremap <tab>l <c-w>l
noremap <tab>w <c-w>w
set mouse-=a
noremap <silent><tab> <nop>
noremap <silent>\e :enew<cr>
noremap <silent>\t :tabnew<cr>
" bnext,Move to next buffer
noremap <silent>\2 :bn<cr>
noremap <silent>\1 :bp<cr>
"noremap <silent>\q :bp <BAR> bd #<cr>
"noremap <silent>\bl :ls<cr>
noremap <silent>\c :Bclose<cr>
"nnoremap <silent>\q :q<cr>
nnoremap <silent>\w :write<cr>
noremap <silent><F4> :GoReferrers<cr>
noremap <silent><space>= :resize +3<cr>
noremap <silent><space>- :resize -3<cr>
noremap <silent><space>[ :vertical resize +3<cr>
noremap <silent><space>] :vertical resize -3<cr>
let g:ackprg = "rg --no-heading --color=never -n"

" Cargo debug
let g:LanguageClient_devel = 1 " Use rust debug build
let g:LanguageClient_loggingLevel = 'DEBUG' " Use highest logging level
let g:neosnippet#enable_completed_snippet=1
