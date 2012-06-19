" .vimrc
set nocompatible " this is vim, not vi

set rtp+=~/repo/jsx.vim

" vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

syntax on
filetype plugin indent on

Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'othree/eregex.vim'
Bundle 'petdance/vim-perl'
Bundle 'hotchpotch/perldoc-vim'
"Bundle 'pangloss/vim-javascript'
Bundle 'bartekd/vim-dart'
Bundle 'basyura/jslint.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'Tagbar'

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

" shortcuts for timestamp
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" disable key recording
noremap q <esc>

" q for QuickRun
noremap Q :QuickRun<CR>

function!Trim()
    let s:cursor = getpos(".")
    %s/\s\+$//e
    call setpos(".", s:cursor)
endfunction

autocmd! BufWritePre *.{sh,t,pl,pm,psgi,xs,rb,py} call Trim()
autocmd! BufWritePre *.{c,cxx,hxx,hpp} call Trim()

autocmd! BufWritePre *.{jsx} call Trim()
"autocmd! BufWritePre *.{js} call Trim()
"autocmd! BufWritePre *.{cpp,m,mm,hpp,java} call Trim()
autocmd! BufWritePre *.{tt,html,htm} call Trim()
autocmd! BufWritePre *rc call Trim()
autocmd! BufWritePre Makefile call Trim()
autocmd! BufWritePre Rakefile call Trim()
autocmd! BufWritePre README call Trim()
autocmd! BufWritePre *.xml call Trim()
autocmd! BufWritePre *.{md,txt} call Trim()
autocmd! BufWritePre *.pegjs call Trim()

"filetype settings
augroup filetypedetect
    autocmd! BufNewFile,BufRead *.t    setf perl
    autocmd! BufNewFile,BufRead *.psgi setf perl
    autocmd! BufNewFile,BufRead *.ph   setf perl
    autocmd! BufNewFile,BufRead *.jake setf javascript
    autocmd! BufNewFile,BufRead *.ejs  setf html
    autocmd! BufNewFile,BufRead *.tt   setf html
    autocmd! BufNewFile,BufRead *.md   setf markdown
    autocmd! BufNewFile,BufRead *.dart setf dart
    autocmd! BufNewFile,BufRead *.jsx  setf jsx
augroup END

au BufRead,BufNewFile Makefile set noexpandtab
au BufRead,BufNewFile *.jsx    set noexpandtab
au BufRead,BufNewFile *.js     set noexpandtab

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
  vnoremap <silent> <Space>y :w !pbcopy<CR><CR>
  nnoremap <silent> <Space>p :r !pbpaste<CR>
  vnoremap <silent> <Space>p :r !pbpaste<CR>
else
  " GVim(Mac & Win)
  noremap <Space>y "+y<CR>
  noremap <Space>p "+p<CR>
endif

" show invisible chars
set list
set listchars=tab:>\ ,eol:$

" for plugins

" neocompletecache
let g:neocomplcache_enable_at_startup = 1

" js setting
function! s:javascript_filetype_settings()
    set noexpandtab
    autocmd BufLeave      <buffer> call jslint#clear()
    autocmd BufWritePost  <buffer> call jslint#check()
    autocmd CursorMoved   <buffer> call jslint#message()
endfunction
autocmd FileType javascript call s:javascript_filetype_settings()

" html setting
function! s:html_filetype_settings()
    set tabstop=2
    set shiftwidth=2
endfunction
autocmd FileType html call s:html_filetype_settings()

" document setting
autocmd FileType md set spell

" outline support
let g:tagbar_sort = 0
nnoremap ; :TagbarToggle<CR><C-w><C-l>

" vimgrep
set grepprg=ack\ -a

" off the IME by the escape key
"inoremap <ESC> <ESC>:set iminsert=0<CR>

" jsx
let g:quickrun_config = {}
let g:quickrun_config.jsx = {
          \ 'command': 'jsx',
          \ 'exec': ['%c --run %s']
          \ }

