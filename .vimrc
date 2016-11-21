" .vimrc
" License: Public Domain or NYSL

set nocompatible " this is vim, not vi

filetype off

if $GOROOT != ''
  set rtp+=$GOROOT/misc/vim
endif

syntax on
filetype plugin indent on

set title
set ruler
set number

set showmatch
set tabstop=4
set expandtab
set smartindent
set autoindent
set backspace=indent,eol,start
set shiftwidth=4
"set pastetoggle=<F11>

set nowrapscan
set incsearch
set ignorecase
set smartcase " search in ignore-case, unless the buffer starts UPPERs

set hlsearch
set showmatch
set showmode

set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932

" avoid new engine's issues (VIM 7.4)
" set regexpengine=1


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
noremap mv <C-w>v
noremap ms <C-w>s
noremap mm :q<CR>


"filetype settings
augroup filetypedetect
    autocmd! BufNewFile,BufRead *.t    setf perl
    autocmd! BufNewFile,BufRead *.psgi setf perl
    autocmd! BufNewFile,BufRead *.ph   setf perl
    autocmd! BufNewFile,BufRead *.jake setf javascript
    autocmd! BufNewFile,BufRead *.ts   setf javascript
    autocmd! BufNewFile,BufRead *.ejs  setf html
    autocmd! BufNewFile,BufRead *.{tt,mt}   setf html
    autocmd! BufNewFile,BufRead *.md   setf markdown
    autocmd! BufNewFile,BufRead *.dart setf dart
    autocmd! BufNewFile,BufRead *.def setf c
augroup END

au BufRead,BufNewFile Makefile set noexpandtab
au BufRead,BufNewFile *.jsx,*.jx    set noexpandtab
au BufRead,BufNewFile *.js     set noexpandtab
"au BufRead,BufNewFile *.html   set noexpandtab

set clipboard+=unnamed
"set clipboard+=autoselect

" highlighten the cursor line only if it's forcused
set cursorline
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorline
    autocmd WinEnter,BufRead * set cursorline
augroup END

"yank and paste clipboard
if has('mac') && !has('gui')
  nnoremap <silent> <Space>y :.w !pbcopy<CR><CR>
  vnoremap <silent> <Space>y :w  !pbcopy<CR><CR>
  nnoremap <silent> <Space>p :r  !pbpaste<CR>
  vnoremap <silent> <Space>p :r  !pbpaste<CR>
else
  " GVim(Mac & Win)
  noremap <Space>y "+y<CR>
  noremap <Space>p "+p<CR>
endif

" show invisible chars
set list
set listchars=tab:>\ ,eol:$

" for plugins

" js setting
function! s:javascript_filetype_settings()
    setlocal tabstop=2
    setlocal shiftwidth=2
    "autocmd BufLeave      <buffer> call jslint#clear()
    "autocmd BufWritePost  <buffer> call jslint#check()
    "autocmd CursorMoved   <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()

" html setting
function! s:html_filetype_settings()
    setlocal tabstop=2
    setlocal shiftwidth=2
endfunction
autocmd FileType html call s:html_filetype_settings()

" ruby setting
function! s:ruby_filetype_settings()
    setlocal tabstop=2
    setlocal shiftwidth=2
endfunction
autocmd FileType ruby call s:html_filetype_settings()

" golang setting
function! s:golang_filetype_settings()
    setlocal noexpandtab
    setlocal tabstop=2
    setlocal shiftwidth=2
endfunction
autocmd FileType go call s:golang_filetype_settings()

" document setting
autocmd FileType md set spell

" off the IME by the escape key
"inoremap <ESC> <ESC>:set iminsert=0<CR>

