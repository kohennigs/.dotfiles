
"------------------------------------------------------------------------
" vim version check and message  
"------------------------------------------------------------------------
if has("gui_running")
  " Gvim
	echon "gVim"
  if has("gui_gtk2") || has("gui_gtk3")
    " Linux GUI
	echo " Linux GUI"
  elseif has("gui_win32")
    " Win32/64 GVim
	echon "Windows GUI
  elseif has("gui_macvim")
    " MacVim
	echon " MacVim" 
  else
    echo "Unknown GUI system!!!!"
  endif
else
  " Terminal vim
	echo "Terminal vim"
endif

"------------------------------------------------------------------------
" general 
"------------------------------------------------------------------------
set history=500 "lines of history vim saves
set number
set lazyredraw " dont redraw while macro is running
set showmatch   " show found matches
set incsearch   " 
set ignorecase
set smartcase 
set hlsearch    " highlight all matches
set nobackup    " dont create backup file
set noswapfile  " dont create swap file
set noundofile  " dont create undo file
set autowrite   " autosave buf while editing (unchecked)
set autoread    " autread extern changed files
set magic       " enable regex (magic)+
set hidden
set backspace=indent,eol,start " backspace problem on macos
"keep quiet
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

filetype plugin on
filetype indent on
