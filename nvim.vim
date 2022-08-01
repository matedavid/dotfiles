call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/plenary.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
call plug#end()

let g:coc_global_extensions = [ 
      \ 'coc-tsserver',
      \ 'coc-go',
      \ 'coc-python',
      \ 'coc-rls',
      \ ]
map <C-n> :NERDTreeToggle<CR>

let g:rustfmt_autosave = 1

let g:gruvbox_contrast_dark = "medium"
colorscheme gruvbox

let g:airline_theme='angr'

syntax on 
set hlsearch
set number
set tabstop=2
set backspace=2
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab

let g:indentLine_color_term = 239 
set updatetime=300

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Telescope find files
nmap <C-p> <cmd>Telescope find_files<CR>

" Tab in visual selection
vmap <Tab> >gv
vmap <S-Tab> <gv

" enable vertical cursor when in insert mode
set guicursor=i:ver1
" enable cursor blinking (append to guicursor)
set guicursor+=a:blinkon1

set number relativenumber
