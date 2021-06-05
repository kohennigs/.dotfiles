echo "Welcome to NeoVim"


"------------------------------------------------------------------------
" simplified os detection 
"   it is a shared config over windows linux an mac
"-----------------------------------------------------------------------
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" example usage 
"if g:os == "Darwin"
"       set guifont=Fira\ Mono:h12
"   elseif g:os == "Linux"
"       set guifont=Fira\ Mono\ 10
"   elseif g:os == "Windows"
"       set guifont=Fira_Mono:h12:cANSI
"   endif

 
"-----------------------------------------------------------------------
" vim version check and message  
"-----------------------------------------------------------------------
if has("gui_running")
  " Gvim
   "echon "gVim"
  if has("gui_gtk2") || has("gui_gtk3")
	" Linux GUI
	echo " Linux GUI"
  elseif has("gui_win32")
	    " Win32/64 GVim
        	"echon "Windows GUI"
  elseif has("gui_macvim")
    " MacVim
    "echon " MacVim" 
  else
    "echo "Unknown GUI system!!!!"
  endif
else
  " Terminal vim
  "echon "Terminal vim"
  let $MYPLUGDIRECTORY = "~/.vim/plugged"
  let $SESSIONHOME = "~/.vim/vim_sessions"
  let g:startify_session_dir= "D:\\vim_sessions"
endif
" use vim . to start project HERE,
" and load custom settings
set exrc

set guicursor=
set relativenumber
set nu
set nohlsearch
set incsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
"set smartcase
"set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set termguicolors
set scrolloff=8
" insertmode completition optiones
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes




"
"mappings
"
let mapleader=" " 
nnoremap <leader>w :w!<CR> " fast saving active file


"
" vim plug 
"
" --------------------------------------------------------------
" Installation of plug.vim
" --------------------------------------------------------------
"

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

endif


call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
" erst mit nvim 0.5 stable auf dem Mac
"Plug 'nvim-telescope/telescope.nvim'

call plug#end()

colorscheme gruvbox 
highlight Normal guibg=none
