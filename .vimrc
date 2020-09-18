
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
    nnoremap <leader>ev :vsplit /Users/koh/koh-git/dotfiles/.vimrc <CR> 
    nnoremap <leader>sv :source /Users/koh/koh-git/dotfiles/.vimrc <CR> 
  else
    echo "Unknown GUI system!!!!"
  endif
else
  " Terminal vim
  echo "Terminal vim"
  let $MYPLUGDIRECTORY = "~/.vim/plugged"
  let $SESSIONHOME = "~/.vim/vim_sessions"
  nnoremap <leader>ev :vsplit /Users/koh/koh-git/dotfiles/.vimrc <CR> 
  nnoremap <leader>sv :source /Users/koh/koh-git/dotfiles/.vimrc <CR> 
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


"--------------------------------------------------------------------
" file search 
"------------------------------------------------------------------------
" search down in subfolders
" tab completition 
set path+=**
set wildmenu " display all matching files
set wildmode=list:full

set splitbelow
set splitright

"------------------------------------------------------------------------

" --------------------------------------------------------------
"Mapping 
" --------------------------------------------------------------
"Motivation:  Möglichst nah an default Konfiguration blieben
" - nur für zusätzliche Belegung als Ergänzung zum Standard einer Funktion 
"   Bsp ESC auch auf  Tab
" Sonst, mit Leader , für eigene Funktionen 

" leader key defined own key mappings
let mapleader = " "
"noremap <Space><Nop>
nnoremap <leader>w :w!<CR> " fast saving active file
nnoremap <leader>d ggdG<CR> " delete all
nnoremap <leader>c ggVG"*y " copy all to sysClipBoard
nnoremap <leader>p "*p " paste from  sysClipBoard
nnoremap <leader>r :w<CR> :! %<CR> " save and RUN
nnoremap <leader>= gg=G'' " reindent the whole file
nnoremap <leader>tsd :put=strftime('%Y%m%d')<CR> " instert timestamp date YYYYMMDD

" fzf git tracked files
nmap <Leader>f :GFiles<CR> 
" fzf file
nmap <Leader>F :Files<CR> 

map <F2> :mksession! $SESSIONHOME\autosave.vim <cr> " Quick write session with F2
map <F3> :source $SESSIONHOME\autosave.vim <cr>     " And load session with F3

" delelte empyt lines
map <F5> :g/^$/d<CR>

" move visual selection 
"  mastering vim quickly Chapter 15
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


" disable the error keys in normal mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" keep last visual selection after indent
vnoremap < <gv
vnoremap > >gv

