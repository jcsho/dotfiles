call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mattn/emmet-vim'

call plug#end()

" General
colorscheme nord
let mapleader=","
let g:mapleader=","
set updatetime=300
set cmdheight=2

" Formatting
set expandtab
set shiftwidth=2
set shiftround
set tabstop=2
set softtabstop=2

set autoindent
set backspace=2
set wrap

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Interface
set stal=2
set showmatch
set ruler
set number
set relativenumber

syntax on
set laststatus=2
set noshowmode
set t_Co=256

" Shortcuts
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
nnoremap <leader>f :Files<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>li :Lines<CR>
nnoremap <leader>bli :BLines<CR>
nnoremap <leader>his :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>m :Marks<CR>
nnoremap <leader>win :Windows<CR>
nnoremap <leader>gs :GFiles?<CR>
nnoremap <leader>log :Commits<CR>
nnoremap <leader>blog :BCommits<CR>

" Extra files
source ~/.config/nvim/statusbar.vim
source ~/.config/nvim/coc-config.vim
source ~/.config/nvim/fzf-config.vim

