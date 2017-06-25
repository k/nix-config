if &compatible
    set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim " path to dein.vim

call dein#begin(expand('~/.vim/dein')) " plugins' root path
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim',
    \{'build': 'make'})

" Dark powered asynchronous completion framework for neovim
call dein#add('Shougo/neocomplete.vim',
    \{'on_i': 1})

call dein#add('Shougo/neoyank.vim')

" Syntastic but uses nvim asyncronous job handling
call dein#add('neomake/neomake')

" Like ctrlp but is customizable and integrates more sources
call dein#add('Shougo/unite.vim')

" Status line at bottom
call dein#add('bling/vim-airline')

" Show buffers at top and side list
call dein#add('jeetsukumaran/vim-buffergator')

" Adds git functionality to vim
call dein#add('tpope/vim-fugitive')

" Adds syntax, filetype, indent files for git files; gitcommit, etc.
call dein#add('tpope/vim-git')

" Macros for editing encapsulating chars 
call dein#add('tpope/vim-surround')

" Automatic session tracking
call dein#add('tpope/vim-obsession')

" Commenting macros
call dein#add('scrooloose/nerdcommenter')

" File System tree 
call dein#add('scrooloose/nerdtree',
      \{'on_cmd': 'NERDTreeToggle'})

" Shows +/-/~ in left column
call dein#add('airblade/vim-gitgutter')

" Window manager for vim splits
call dein#add('captbaritone/dwm.vim' )

" Syntax and scripts for Lilypond
call dein#add('qrps/lilypond-vim')

" Javascript, impoved syntax highlighting and indentation
call dein#add('pangloss/vim-javascript')

" Coffeescript support
call dein#add('kchmck/vim-coffee-script')

" Angular.js
call dein#add('burnettk/vim-angular')

" Semantic Highlighting
" Plugin 'jaxbot/semantic-highlight.vim'

" Typescript syntax highlighting
call dein#add('leafgarland/typescript-vim',
    \{'on_ft': 'typescript'})

" Typescript auto completion
call dein#add('Quramy/tsuquyomi',
    \{'on_ft': 'typescript'})

" System Verilog syntax highlighting
call dein#add('nachumk/systemverilog.vim',
    \{'on_ft': ['verilog', 'systemverilog']})

call dein#add('lervag/vimtex',
            \{'on_ft': ['tex', 'latex', 'plaintex']})

call dein#add('vim-scripts/applescript.vim',
    \{'on_ft': ['applescript']})

call dein#add('daeyun/vim-matlab',
    \{'on_ft': ['matlab']})


call dein#end()
filetype plugin indent on 

set nobackup
set nowritebackup

filetype off

set tabstop=4 " set tabstop at 4
set shiftwidth=4 " 
set expandtab
set smartcase
set autoindent
set smartindent

set visualbell t_vb=

" But tab should be 2 spaces in HTML and Smarty templates
 autocmd FileType html,xml
   \ setlocal shiftwidth=4 |
   \ setlocal tabstop=4 |
   \ setlocal foldmethod=indent
 autocmd FileType htmldjango
   \ setlocal shiftwidth=4 |
   \ setlocal tabstop=4 |
   \ setlocal foldmethod=indent
 autocmd FileType smarty  
   \ setlocal shiftwidth=2 |
   \ setlocal tabstop=2
 autocmd FileType jade 
   \ setlocal shiftwidth=2 |
   \ setlocal tabstop=2 |
   \ setlocal noexpandtab
 autocmd FileType ruby
   \ setlocal tabstop=2 |
   \ setlocal shiftwidth=2
 autocmd FileType python
   \ setlocal shiftwidth=4 |
   \ setlocal tabstop=4 |
   \ setlocal softtabstop=4

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
:let mapleader = ","
nnoremap <leader>p :set paste<CR>"*p<CR>:set nopaste<CR>
inoremap <leader>p <Esc>:set paste<CR>"*p<CR>:set nopaste<CR>
nnoremap <leader>c ggVG"*yy
vnoremap <leader>c "*y

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

" Clear trailing whitespace
nnoremap <leader>w :%s/\s\+$//<cr>

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

highlight Pmenu ctermfg=green ctermbg=black

" Fix keycodes
map ^[[1~ <Home>
map ^[[4~ <End>
imap ^[[1~ <Home>
imap ^[[4~ <End>

set laststatus=2   " Always show the statusline

" Ignore files
set wildignore+=*/tmp/*,*.pyc,*.so,*.swp,*.zip,*/gen/*,*.tar.*,*/node_modules/*

"" Lilypond
filetype off
set runtimepath+=/usr/local/bin/lilypond/current/vim/
filetype on

"" NERDTree
nmap <leader>d :NERDTreeToggle<CR>

"" Neomake

" Run :Neomake! on every write
autocmd! BufWritePost * Neomake

" JS
let g:neomake_javascript_enabled_makers=["jshint"]

" Coffee
let g:neomake_coffee_enabled_makers=["coffeelint"]

" Python
let g:neomake_python_enabled_makers=["pep8"]

" Typescript
let g:neomake_typescript_enabled_makers=["tslint", "tsc"]

"" Vim airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"" Unite

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])

if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
    \ '-i --vimgrep --hidden --ignore ' .
    \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_rec_async_command =
            \ ['ag', '--follow', '--nocolor', '--nogroup',
            \ '--hidden', '-g', '']
endif

" File searching (CtrlP)
nnoremap <C-p> :Unite file_rec/git<cr>
" nnoremap <C-p> :call s:ctrlp()<cr>

function! s:ctrlp()"{{{
    if has('.git')
        unite file_rec/git<cr>
    else
        unite file_rec<cr>
    endif
endfunction"}}}


nnoremap <space>/ :Unite grep:.<cr>

" Reindex Unite
nnoremap <F5> <Plug>(unite_remake)

" Yank history
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>

" Buffers View the entire list of buffers open
nmap <leader>ls :Unite -start-insert file
cnoreabbrev ls :Unite -start-insert buffer
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
 " Overwrite settings.

  imap <buffer> jj      <Plug>(unite_insert_leave)
  " Runs "split" action by <C-s>.
  imap <silent><buffer><expr> <C-s>     unite#do_action('split')
endfunction"}}}

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

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

nnoremap <leader>s :bel :sp 
nnoremap <leader>v :bel vsp 
nnoremap <leader>t :tabnew<cr>

"" Tagbar
nmap <F8> :TagbarToggle<CR>

"" Neocomplete
" Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
"
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

"AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1


"" Vimtex
let g:vimtex_fold_enabled = 1
nnoremap <localleader>lt :<c-u>Unite vimtex_toc<cr>
nnoremap <localleader>ly :<c-u>Unite vimtex_labels<cr>

let g:vimtex_view_general_viewer
            \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" This adds a callback hook that updates Skim after compilation
let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
    if !a:status | return | endif

    let l:out = b:vimtex.out()
    let l:tex = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']
    if !empty(system('pgrep Skim'))
        call extend(l:cmd, ['-g'])
    endif
    if has('nvim')
        call jobstart(l:cmd + [line('.'), l:out, l:tex])
    elseif has('job')
        call job_start(l:cmd + [line('.'), l:out, l:tex])
    else
        call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
    endif
endfunction

"" TODO fix this if statement
"if filereadable("~/.vimrc_local")
source ~/.vimrc_local
"endif

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif


set exrc
set secure

