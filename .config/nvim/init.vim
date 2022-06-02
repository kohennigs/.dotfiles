if($USER=="koh")
    echo "Welcome to NeoVim@home!"
else
    echo "Welcome to NeoVim, bcskahe"
endi

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
if g:os == "Darwin"
       set guifont=Fira\ Mono:h12
   elseif g:os == "Linux"
       set guifont=Fira\ Mono\ 10
   elseif g:os == "Windows"
       "set guifont=Consolas:h8
       GuiFont! Consolas:h8
  endif

 
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


"------------------------------------------------------------------------
" @work specific pathes
"------------------------------------------------------------------------
if ($USER=="koh")
    "echon "normal config"
    "let $HOME = $USERPROFILE
    let $c='$HOME/.vim/'
    let $MYPLUGDIRECTORY = "$HOME/.vim/plugged/"
    let $SESSIONHOME = '$HOME/.vim/vim_sessions'
    set undodir='$HOME/.vim/undo/'
    "let $PYTHONHOME = 'D:\\Programme\\Python37'
    let g:startify_session_dir= $SESSIONHOME
    " --------------------------------------------------------------
    " vimwiki configuration
    " --------------------------------------------------------------
    " vimwiki, used at work only
    let g:vimwiki_list = [{
                \ 'path'        : '$HOME/.vim/vimwiki',
                \ 'path_html'   : '$HOME/.vom/vimwiki',
                \ 'auto_toc'    : 1
                \}]
    let g:vimwiki_toc_header = 'Inhalt'
else 
    let $VIMHOME="D:\\prog\\Vim"
    set undodir=$VIMHOME\\undofiles
    let $MYPLUGDIRECTORY = "D:\\prog\\Vim\\plugged"
    let $SESSIONHOME = "D:\\vim_sessions"
    let $PYTHONHOME = "D:\\Programme\\Python37"
    let $HOME = $USERPROFILE
    let g:startify_session_dir= "D:\\vim_sessions"
    " --------------------------------------------------------------
    " vimwiki configuration
    " --------------------------------------------------------------
    " vimwiki, used at work only
    let g:vimwiki_list = [{
                \ 'path'        : 'D:\\Projekte\\_wiki\\',
                \ 'path_html'   : 'D:\\Projekte\\_wiki\\',
                \ 'auto_toc'    : 1
                \}]
    let g:vimwiki_toc_header = 'Inhalt'
endif


" use vim . to start project HERE,
" and load custom settings
set exrc

set guicursor=
"set relativenumber
set nu
set numberwidth=5
set nohlsearch
set incsearch
set hidden
set autowrite   " autosave buf while editing (unchecked)
set autoread    " autread extern changed files
set magic       " enable regex (magic)+
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
set undolevels=1000
set termguicolors
set scrolloff=8
set inccommand=split
" insertmode completition optiones
set completeopt=menu
"set completeopt=menuone,noinsert,noselect
"set colorcolumn=80
set signcolumn=yes
" from my vimrc
set history=500 "lines of history vim saves
set lazyredraw " dont redraw while macro is running
set showmatch   " show found matches
set ruler
set laststatus=2        " alwys show the status line
set splitbelow
set splitright
set mouse=a

syntax enable           " enable syntax hl

filetype plugin on
filetype indent on

"--------------------------------------------------------------------
" file search 
"------------------------------------------------------------------------
" search down in subfolders
" tab completition 
"set path+=**
"set wildmenu " display all matching files
"set wildmode=list:full


"------------------------------------------------------------------------
"mappings
" mode lhs rhs
" n = normal mode
" nore = no recursive exec
" map ;-) 
"------------------------------------------------------------------------
let mapleader=" " 


if ($USER=="koh")
    nnoremap <leader>sv :source ~/koh-git/dotfiles/.config/nvim/init.vim<CR> 
    nnoremap <leader>ev :vsplit ~/koh-git/dotfiles/.config/nvim/init.vim<CR> 
else
    nnoremap <leader>ev :vsplit D:\Projekte\koh_git\dotfiles\.config\nvim\init.vim<CR>  
    nnoremap <leader>sv :source D:\Projekte\koh_git\dotfiles\.config\nvim\init.vim<CR> 
endif


nnoremap <leader>w :w!<CR>" fast saving active file
nnoremap <leader><space> :e<CR> " fast reread file



" old / unsused mappings, just a graveyard 
" for memories. May be reappear as a Zombie.
"nnoremap <leader>d ggdG<CR> " delete all
nnoremap <leader>c ggVG"*y " copy all to sysClipBoard
nnoremap <leader>p "*p " paste from  sysClipBoard
"nnoremap <leader>r :w<CR> :! %<CR> " save and RUN
nnoremap <leader>= gg=G'' " reindent the whole file
nnoremap <leader>tsd :put=strftime('%Y%m%d')<CR> " instert timestamp date YYYYMMDD
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc> " Leave HLSearch
"nnoremap <leader>sw :mks! D:\vim_sessions\autosave.vim<CR> " save sess to autsave
"nnoremap <leader>sr :so D:\vim_sessions\autosave.vim<CR> " load sess from autsave

"TODO create mac/linux version of saveing session
"
"set foldlevel=1
"nmap <leader>f0 :set foldlevel=0<CR>
"nmap <leader>f1 :set foldlevel=1<CR>
"nmap <leader>f2 :set foldlevel=2<CR>
"nmap <leader>f3 :set foldlevel=3<CR>
"nmap <leader>f4 :set foldlevel=4<CR>
"nmap <leader>f5 :set foldlevel=5<CR>
"nmap <leader>f6 :set foldlevel=6<CR>
"nmap <leader>f7 :set foldlevel=7<CR>
"nmap <leader>f8 :set foldlevel=8<CR>
"nmap <leader>f9 :set foldlevel=9<CR>


"------------------------------------------------------------------------
" svn mappings 
"------------------------------------------------------------------------
" svn log
nmap <Leader>sl :! svn log -l3 %<CR>
" svn diff
nmap <Leader>sd :! svn diff %<CR>
" svn update
nmap <Leader>su :! svn update %<CR>
" svn commit
nmap <Leader>sc :! svn commit %<CR>


"------------------------------------------------------------------------
" fzf mappings 
"------------------------------------------------------------------------
" git tracked files
nmap <Leader>F :GFiles<CR> 
" find all files
nmap <Leader>f :Files<CR> 
" find bufferers
nmap <Leader>b :Buffers<CR>
" find in history
nmap <Leader>h :History<CR>
" find in current buffer
nmap <Leader>l :BLines<CR>
" find in all open buffers
nmap <Leader>L :Lines<CR>
" find in marks
nmap <Leader>m :Marks<CR>
" find in vim s help
nmap <Leader>H :Helptags!<CR>

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



" fullscreen under windows
" https://vi.stackexchange.com/questions/1937/how-do-i-get-gvim-to-start-maximised-in-windows 
if g:os == "Windows"
  "run the command immediately when starting vim
  "autocmd VimEnter * call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
  " activate/deactivate full screen with function key <F11>  
  map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif


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


"call plug#begin('~/.vim/plugged')
call plug#begin($MYPLUGDIRECTORY)

" verfied
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'chrisbra/vim-commentary'
"Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'machakann/vim-highlightedyank'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/vim-peekaboo'"
Plug 'gruvbox-community/gruvbox'

"Plug 'neovim/nvim-lspconfig'

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

Plug 'lervag/vimtex'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" testing 
"Plug 'lervag/vimtex'
"Plug 'wellle/targets.vim'
"Plug 'tmhedberg/SimpylFold'
"Plug 'Valloric/YouCompleteMe'
"Plug 'sainnhe/vim-color-atlantis'
"Plug 'chase/focuspoint-vim'
"Plug 'neoclide/coc.vim',{'branch': 'release'}

"eher nicht
"Plug 'vimwiki/vimwiki'

" laufen nicht unter Win
"Plug 'lambdalisue/vim-fullscreen'
call plug#end()

colorscheme gruvbox 
highlight Normal guibg=none

" --------------------------------------------------------------
" vim-highlightedyank  configuration
" --------------------------------------------------------------
let g:highlightedyank_highlight_duration = 250

" --------------------------------------------------------------
" peekaboo configuration   
" --------------------------------------------------------------
 "You can toggle fullscreen mode by pressing spacebar.

let g:peekaboo_window='vertical botright 60new'
let g:peekaboo_delay=10
let g:peekaboo_compact=0

" --------------------------------------------------------------
" commentary configuration   
" --------------------------------------------------------------
autocmd FileType VHDL setlocal commentstring=--\ %s

" --------------------------------------------------------------
" smoothie  configuration   
" --------------------------------------------------------------


"------------------------------------------------------------------------
" folding 
"------------------------------------------------------------------------
"enable folding 
set foldmethod=syntax
"set foldmethod=indent
set foldlevel=99


" --------------------------------------------------------------
" netrw stettings
" --------------------------------------------------------------
let g:netrw_banner = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_winsize = 30
