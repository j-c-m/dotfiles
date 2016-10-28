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
else
  set autoindent                " always set autoindenting on
endif " has("autocmd")

if &term =~ "^xterm"
    set t_Co=256
endif

colorscheme kolor

set pastetoggle=<F2>
