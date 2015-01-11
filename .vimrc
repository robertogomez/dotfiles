" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set backup        " keep a backup file
endif
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

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
  " git commit settings
  autocmd FileType gitcommit setlocal spell textwidth=72

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

  set cindent       " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

set tabstop=4
set shiftwidth=4
set expandtab
set fileencoding=utf-8

" Set filetype to text if not set
autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif
" Key binding for clearing seach pattern
nnoremap <F2> :let @/ = ""
" Toggle paste option for pasting formatted text correctly
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
set showmode

" Enable plugin manager pathogen
execute pathogen#infect()
" Perform syntax checks on file open
let g:syntastic_check_on_open=1
" Don't perform syntax checks on :wq
let g:syntastic_check_on_wq=0
" Customized symbols for errors and warnings
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='!'
" Disable don't use ID's rule for csslint
let g:syntastic_css_csslint_args = "--ignore=ids"
" Check Python 2 rather than 3
let g:syntastic_python_python_exec = '/usr/bin/python2'

" Enable 256 colors
set t_Co=256
set background=dark

colorscheme delek

" The following must come after the colorscheme to avoid being overwritten
" Change gutter color
highlight SignColumn ctermbg=black

" Change Syntastic sign colors
highlight SyntasticErrorSign ctermfg=black ctermbg=red
highlight SyntasticWarningSign ctermfg=black ctermbg=yellow

