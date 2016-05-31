set nocompatible
filetype off
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" My Plugins here:
"
" original repos on github
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'vim-scripts/a.vim.git'
Plugin 'kien/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'template.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-git' 
Plugin 'tpope/vim-obsession'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'digitaltoad/vim-jade'
Plugin 'airblade/vim-gitgutter'
Plugin 'kchmck/vim-coffee-script'
" Window manager for vim splits
Plugin 'captbaritone/dwm.vim' 
" Syntax and scripts for Lilypond
Plugin 'qrps/lilypond-vim'
" Pydoc integration
Plugin 'fs111/pydoc.vim'
Plugin 'moll/vim-node'
call vundle#end()
filetype plugin indent on 

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set nobackup
set nowritebackup

filetype off

set tabstop=4 " set tabstop at 4
set shiftwidth=4 " 
set expandtab
set smartcase
set autoindent
set smartindent

" But tab should be 2 spaces in HTML and Smarty templates
 autocmd FileType html
   \ setlocal shiftwidth=2 |
   \ setlocal tabstop=2 |
   \ setlocal noexpandtab
 autocmd FileType smarty  
   \ setlocal shiftwidth=2 |
   \ setlocal tabstop=2
 autocmd FileType jade 
   \ setlocal shiftwidth=2 |
   \ setlocal tabstop=2 |
   \ setlocal noexpandtab
 autocmd FileType coffee
   \ setlocal noexpandtab
 autocmd FileType ruby
   \ setlocal tabstop=2 |
   \ setlocal shiftwidth=2

"  Shows all options
set wildmenu
set wildmode=longest,list,full

set number
set cursorline
colors elflord

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set pastetoggle=<F10>CR
nmap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
imap <leader>p <Esc>:set paste<CR>"*p<CR>:set nopaste<CR>
nmap <leader>c ggVG"*yy
vmap <leader>c "*y

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

set dir=~/.vim/swp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Clear highlights
nnoremap <leader>\ :nohl<cr>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"Bubble single lines (kicks butt)
"http://vimcasts.org/episodes/bubbling-text/
nmap <C-Up> ddkP
nmap <C-Down> ddp
"Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
"lowers the timeout after typing leader key
set timeoutlen=500
"allow code folding
set foldenable

"comment lines
fu! CommentLineANSI()
    if empty(matchstr(getline('.'),'^\s*/\*.*\*/\s*'))
        :s/^\(.*\)$/\/*\1*\//
        else
            :s/^\/\*\(.*\)\*\//\1/
        endif
            :silen! /dskfldsjkldd
endfunction
fu! CommentBlock()
    :'< s/^/\/*/
    :'> s/$/*\//
endfu
nmap <C-_> :call CommentLineANSI()<CR>
imap <C-_> <C-0> :call CommentLineANSI()<CR>
vmap <C-_> :call CommentLineANSI()<CR>gv


highlight Pmenu ctermfg=green ctermbg=black

" Fix keycodes
map ^[[1~ <Home>
map ^[[4~ <End>
imap ^[[1~ <Home>
imap ^[[4~ <End>

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

"" Lilypond
filetype off
set runtimepath+=/usr/local/bin/lilypond/current/vim/
filetype on

"" NERDTree
nmap <leader>d :NERDTreeToggle<CR>

"" SYNTASTIC
" Use flake8 for python error checking
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers=["jshint"]
let g:syntastic_python_checkers=["pep8","flake8"]
let g:syntastic_python_pep8_args='--max-line-length=100'
let g:syntastic_python_pep8_post_args='--ignore=E125'
let g:syntastic_python_flake8_args='--max-line-length=100'
let g:syntastic_python_flake8_post_args='--ignore=E125'
let g:syntastic_c_cflags_file='~/.syntastic_c_flags'

"" Vim airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


"" CtrlP
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

"" Buffers
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>n :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

nnoremap <leader>s :bel :sp 
nnoremap <leader>v :bel vsp 
nnoremap <leader>t :tabnew<cr>


"" Buffergator
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
"let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" Shared bindings from Solution #1 from earlier
nmap <leader>n :enew<cr>
nmap <leader>bq :bp <BAR> bd #<cr>

"" Tagbar
nmap <F8> :TagbarToggle<CR>

set exrc
set secure
