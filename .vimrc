" .vimrc
set nocompatible " this is vim, not vi

set title
set ruler
set number

syntax on
filetype plugin indent on

" vundle
set rtp+=~/.vim/vundle
call vundle#rc()

Bundle 'Shugo/nocomplcache'
Bundle 'Shugo/unite.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'othree/eregex.vim'
Bundle 'petdance/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
Bundle 'pangloss/vim-javascript'
Bundle 'basyura/jslint.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'taglist-plus'
Bundle 'current-func-info.vim'

set showmatch
set tabstop=4
set expandtab
set smartindent
set autoindent
set backspace=indent,eol,start
set shiftwidth=4
set pastetoggle=<F11>
"set listchars=eol:$,tab=:>-

set nowrapscan
set incsearch
set ignorecase
set smartcase " search in ignore-case, unless the buffer starts UPPERs

set hlsearch
set showmatch
set showmode

set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932



" auto cd
"au  BufEnter *   execute ":lcd " . expand("%:p:h")

" <space>s. - reload .vimrc
nnoremap <Space>s. :<C-u>source $MYVIMRC<CR>

" shortcut for :help
nnoremap <C-i> :<C-u>help<Space>
" show help aboutthe current word by :help
nnoremap <C-i><C-i> :<C-u>help<Space><C-r><C-w><CR>

nmap <ESC><ESC> :nohlsearch<CR><ESC>

" move
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" vim windows
noremap mh <C-w><C-h>
noremap mj <C-w><C-j>
noremap mk <C-w><C-k>
noremap ml <C-w><C-l>
noremap mv <C-w><C-v>
noremap ms <C-w><C-h>
noremap mm :q<CR>

" shortcuts for timestamp
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')


function!Trim()
    let s:cursor = getpos(".")
    %s/\s\+$//e
    call setpos(".", s:cursor)
endfunction
autocmd! BufWritePre *.{pl,pm,t,psgi,c,xs,rb,py,txt,tx,html} call Trim()
autocmd! BufWritePre *{vimrc,bashrc} call Trim()

"perl settings
augroup filetypedetect
    autocmd! BufNewFile,BufRead *.t    setf perl
    autocmd! BufNewFile,BufRead *.psgi setf perl
    autocmd! BufNewFile,BufRead *.inc  setf xs
    autocmd! BufNewFile,BufRead *.ejs  setf html
augroup END

au BufRead,BufNewFile Makefile set noexpandtab

"set clipboard+=unnamed
"set clipboard+=autoselect

" highlighten the cursor line only if it's forcused
"set cursorline
"augroup cch
"    autocmd! cch
"    autocmd WinLeave * set nocursorline
"    autocmd WinEnter,BufRead * set cursorline
"augroup END

"yank and paste clipboard
if has('mac') && !has('gui')
  nnoremap <silent> <Space>y :.w !pbcopy<CR><CR>
  vnoremap <silent> <Space>y :w !pbcopy<CR><CR>
  nnoremap <silent> <Space>p :r !pbpaste<CR>
  vnoremap <silent> <Space>p :r !pbpaste<CR>
else
  " GVim(Mac & Win)
  noremap <Space>y "+y<CR>
  noremap <Space>p "+p<CR>
endif

" for plugins

" jslint
function! s:javascript_filetype_settings()
    autocmd BufLeave      <buffer> call jslint#clear()
    autocmd BufWritePost  <buffer> call jslint#check()
    autocmd CursorMoved   <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()

" taglist
let g:Tlist_Close_On_Select   = 1
let g:Tlist_Display_Prototype = 1
let g:Tlist_Use_Right_Window  = 1
nnoremap ; :TlistToggle<CR><C-w><C-l>

let &statusline = '[%{cfi#get_func_name()}()]'

