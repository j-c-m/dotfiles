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

colorscheme ansi-dim

set pastetoggle=<F2>
set number

set clipboard=unnamedplus
if has('clipboard')
  set clipboard+=autoselect
endif

if !empty(globpath(&packpath, 'pack/*/opt/osc52'))
  packadd osc52
endif
if exists('v:clipproviders') && has_key(v:clipproviders, 'osc52')
  set clipmethod+=osc52

  " clipboard-providers ignore autoselect; copy Visual to + (OSC 52;c)
  function! s:Osc52Autoselect() abort
    if v:clipmethod !=# 'osc52'
      return
    endif
    if mode() =~# "^[vV\<C-v>]"
      let l:type = mode()
      let l:a = getpos('v')
      let l:b = getpos('.')
    else
      let l:type = visualmode()
      let l:a = getpos("'<")
      let l:b = getpos("'>")
    endif
    if empty(l:type) || l:a[1] < 1 || l:b[1] < 1
      return
    endif
    let l:lines = getregion(l:a, l:b, {'type': l:type})
    if empty(l:lines)
      return
    endif
    let l:payload = l:type . "\n" . join(l:lines, "\n")
    if l:payload ==# get(s:, 'osc52_last', '')
      return
    endif
    let s:osc52_last = l:payload
    call setreg('+', l:lines, l:type)
  endfunction

  xnoremap <silent> <LeftRelease> <LeftRelease><Cmd>call <SID>Osc52Autoselect()<CR>
  augroup Osc52Autoselect
    autocmd!
    autocmd ModeChanged [vV\x16]*:* call s:Osc52Autoselect()
    autocmd FocusLost * if mode() =~# "^[vV\<C-v>]" | call s:Osc52Autoselect() | endif
  augroup END
endif

if has('mouse')
  set mouse=a
  set ttymouse=sgr
endif

function! DetectIndent() abort
  let l:tabs = 0
  let l:spaces = 0
  let l:two = 0
  let l:four = 0
  let l:prev = -1

  for l:line in getline(1, 200)
    if l:line =~# '^\s*$' || l:line =~# '^\s*\%(//\|/\*\|\*\|#\|"\|--\)'
      continue
    endif
    if l:line =~# '^\t'
      let l:tabs += 1
      let l:prev = -1
    elseif l:line =~# '^ '
      let l:spaces += 1
      let l:n = len(matchstr(l:line, '^ *'))
      if l:prev >= 0 && l:n > l:prev
        let l:d = l:n - l:prev
        if l:d == 2 && (l:prev == 0 || l:prev % 4 != 0)
          let l:two += 1
        elseif l:d == 4
          let l:four += 1
        endif
      endif
      let l:prev = l:n
    else
      let l:prev = 0
    endif
  endfor

  if l:tabs > 0 && l:tabs >= l:spaces
    setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=-1
  elseif l:spaces > 0
    let l:sw = l:two > l:four ? 2 : 4
    setlocal expandtab
    execute 'setlocal tabstop=' . l:sw 'shiftwidth=' . l:sw 'softtabstop=-1'
  endif
endfunction
