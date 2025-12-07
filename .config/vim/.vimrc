set expandtab 
set clipboard=unnamedplus 
set tabstop=4
set softtabstop=4
set shiftwidth=4

set number 
set relativenumber 
set termguicolors

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'SirVer/ultisnips'
Plug 'vimsence/vimsence'
Plug 'lifepillar/vim-solarized8'

call plug#end() 

colorscheme solarized8
set background=dark

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
let g:UltiSnipsExpandTrigger="<tab>"

let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>so :source<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K :call CocActionAsync('doHover')<CR>
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>f <Plug>(coc-format)

hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE
hi VertSplit guibg=NONE
hi StatusLine guibg=NONE
hi LineNr guibg=NONE
hi NonText guibg=NONE
