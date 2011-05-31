" .vimrc
set nocompatible " this is vim, not vi

syntax on

set showmatch
set tabstop=4
set expandtab
set smartindent
set autoindent
set backspace=indent,eol,start
set shiftwidth=4
"set pastetoggle=<F11>

set number
set nowrapscan
set incsearch
set ignorecase
set smartcase " search in ignore-case, unless the buffer starts UPPERs
set hlsearch


" auto cd
"au  BufEnter *   execute ":lcd " . expand("%:p:h")

" <space>s. - reload .vimrc
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>
" show help aboutthe current word by :help
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>
" shortcut for :help
"nnoremap <C-h> :<C-u>help<Space>

" move
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" move in wndows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

inoremap <expr> ,df strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,utf-8,cp932

function!Trim()
    let s:cursor = getpos(".")
    %s/\s\+$//e
    call setpos(".", s:cursor)
endfunction
autocmd! BufWritePre *.{pl,pm,t,psgi,c,xs,rb,py,txt,tx,html} call Trim()

"perl settings
augroup filetypedetect
    autocmd! BufNewFile,BufRead *.t    setf perl
    autocmd! BufNewFile,BufRead *.psgi setf perl
    autocmd! BufNewFile,BufRead *.inc  setf xs
    autocmd! BufNewFile,BufRead *.ejs  setf html
augroup END

au BufRead,BufNewFile Makefile set noexpandtab

set clipboard=unnamed

" for plugins

" vundle
set rtp+=~/.vim/vundle
call vundle#rc()

" yanktmp http://www.vim.org/scripts/script.php?script_id=1598
map <silent> sy :call YanktmpYank()<cr>
map <silent> sp :call YanktmpPaste_p()<cr>
map <silent> sP :call YanktmpPaste_P()<cr>
let g:yanktmp_file = '~/tmp/vim-yanktmp'

" taglist.vim
let g:Tlist_Close_On_Select   = 1
let g:Tlist_Display_Prototype = 1
let g:Tlist_Use_Right_Window  = 1
nnoremap ; :TlistToggle<Enter><C-w>l

