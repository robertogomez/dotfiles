" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

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

