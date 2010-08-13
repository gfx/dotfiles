" .vimrc
set nocompatible " must be first!

syntax on

set showmatch
set tabstop=4
set expandtab
set smartindent
set autoindent
set backspace=indent,eol,start
set shiftwidth=4

"set number
set nowrapscan
set incsearch
set ignorecase
set smartcase " search in ignore-case, unless the buffer starts UPPERs

" auto cd
"au  BufEnter *   execute ":lcd " . expand("%:p:h")

" <space>s. - reload .vimrc
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>

set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,utf-8,cp932 


"perl setting
augroup filetypedetect
autocmd! BufNewFile,BufRead *.t setf perl
autocmd! BufNewFile,BufRead *.psgi setf perl
augroup END

