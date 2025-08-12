" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup          " do not keep a backup file, use versions instead
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

if &t_Co > 2 || has("gui_running")
 syntax on
  set hlsearch
endif

syntax on
set tabstop=4        " tab and shift to be 4 spaces
set shiftwidth=4
set expandtab        " use spaces instead of tabs

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

  " Check if a swap file exists and set read-only if another Vim instance has the file open
  augroup CheckSwapFile
  	autocmd!
    autocmd SwapExists * let v:swapchoice = 'o'
  augroup END

  " Run DetectIndent when opening a file
  augroup DetectIndent
    autocmd!
    autocmd BufReadPost * call DetectIndent()
  augroup END
else
  set autoindent                " always set autoindenting on
endif " has("autocmd")

if &t_Co > 16
  set t_Co=16
endif

colorscheme habamax

set pastetoggle=<F2>
set number

" Function to detect indentation style
function! DetectIndent()
  " Check the first 1000 lines for indentation patterns
  let l:lines = getline(1, 1000)
  let l:has_tabs = 0
  let l:has_spaces = 0
  let l:indent_size = 0
  let l:lnum = 1

  " Enable syntax highlighting if not already enabled
  if !exists('b:current_syntax')
    silent! syntax enable
  endif

  " Analyze lines for tabs or spaces
  for l:line in l:lines
    let l:is_comment = synIDattr(synID(l:lnum, 1, 1), 'name') =~? 'comment'
    if !l:is_comment
      if l:line =~ '^\t\+'
        let l:has_tabs += 1
      elseif l:line =~ '^\s\+'
        let l:has_spaces += 1
        " Estimate indent size (count spaces at start)
        let l:spaces = matchstr(l:line, '^\s\+')
        let l:count = len(l:spaces)
        if l:count > 0 && (l:indent_size == 0 || l:count < l:indent_size)
          let l:indent_size = l:count
        endif
      endif
    endif
    let l:lnum += 1
  endfor

  " Set indentation based on findings
  if l:has_tabs > l:has_spaces
    setlocal noexpandtab
    setlocal tabstop=4 shiftwidth=4
  elseif l:has_spaces
    setlocal expandtab
    if l:indent_size > 0
      let l:ts = l:indent_size <= 8 ? l:indent_size : 2
      let l:ts = l:ts >= 2 ? l:ts : 2
      execute 'setlocal tabstop=' . l:ts
      execute 'setlocal shiftwidth=' . l:ts
    else
      setlocal tabstop=2 shiftwidth=2
    endif
  endif
endfunction
