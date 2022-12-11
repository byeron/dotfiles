call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'jreybert/vimagit'
Plug 'tomasr/molokai'
call plug#end()

let mapleader = "\<space>"

" PLUGIN: FZF
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>

" PLUGIN: vim-Lsp
nnoremap <silent> <Leader>d :LspDocumentFormat<CR>

set laststatus=2
set t_Co=256

colorscheme molokai
