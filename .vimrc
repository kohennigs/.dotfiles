"------------------------------------------------------------------------
" task list 
"-----------------------------------------------------------------------
" Red BGG Color in Wiki ? Theme?
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


"------------------------------------------------------------------------
" @work specific pathes
"------------------------------------------------------------------------
if ($USER=="koh")
    "echon "normal config"
    "let $HOME = $USERPROFILE
    let $VIMHOME='$HOME/.vim/'
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
    "echo "bcs config"
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
"set noundofile  " dont create undo file
set undofile
set undolevels=1000
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
set showcmd             " show command line 

filetype plugin on
filetype indent on

"------------------------------------------------------------------------
" appearence 
"------------------------------------------------------------------------
syntax enable           " enable syntax hl
"colorscheme gruvbox      " select color scheme
"set relativenumber	    " show relative numbers
set numberwidth=5
set number              " show line numbers
set showcmd             " show command line 
"
"Linenumbers
hi CursorLineNr ctermbg=black  
"" keep Linenumber BG-Color Black
"
"set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=black
"
""cursorline settings
"" src: 
""  https://stackoverflow.com/questions/7614546/vim-cursorline-color-change-in-insert-mode
"set cursorline
"
"" CursorLine blue 
highlight CursorLine guifg=white guibg=blue ctermfg=white ctermbg=blue  "nice blue CursorLine
""autocmd InsertEnter * highlight CursorLine guifg=white guibg=blue ctermfg=white ctermbg=blue
""autocmd InsertLeave * highlight CursorLine guifg=white guibg=darkblue ctermfg=white ctermbg=darkblue
"
"" underline settings ( ..viwiki)
hi UnderLined ctermfg=black ctermfg=white

set encoding=utf-8
set expandtab
set softtabstop=4
set tabstop=4
set shiftwidth=4
set so=10                " set n lines the the cursoer j/k
"set autochdir           " autochange dir to active files dir
set ruler               " always show current position
set laststatus=2        " alwys show the status line
set splitbelow
set splitright

"--------------------------------------------------------------------
" file search 
"------------------------------------------------------------------------
" search down in subfolders
" tab completition 
set path+=**
set wildmenu " display all matching files
set wildmode=list:full

"------------------------------------------------------------------------

" --------------------------------------------------------------
"Mapping 
" --------------------------------------------------------------
" leader key defined own key mappings
let mapleader = " "

if ($USER=="koh")
    nnoremap <leader>sv :source ~/koh-git/dotfiles/.vimrc <CR> 
    nnoremap <leader>ev :vsplit ~/koh-git/dotfiles/.vimrc <CR> 
else
    nnoremap <leader>ev :vsplit D:\Projekte\koh_git\dotfiles\.vimrc<CR>  " open git VIMRC in vsplit
    nnoremap <leader>sv :source D:\Projekte\koh_git\dotfiles\.vimrc<CR>  " source git VIMRC
endif

nnoremap <leader>w :w!<CR> " fast saving active file
nnoremap <leader>d ggdG<CR> " delete all
nnoremap <leader>c ggVG"*y " copy all to sysClipBoard
nnoremap <leader>p "*p " paste from  sysClipBoard
nnoremap <leader>r :w<CR> :! %<CR> " save and RUN
nnoremap <leader>= gg=G'' " reindent the whole file
nnoremap <leader>tsd :put=strftime('%Y%m%d')<CR> " instert timestamp date YYYYMMDD
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc> " Leave HLSearch
nnoremap <leader>sw :mks! D:\vim_sessions\autosave.vim<CR> " save sess to autsave
nnoremap <leader>sr :so D:\vim_sessions\autosave.vim<CR> " load sess from autsave
"TODO create mac/linux version of saveing session
"
set foldlevel=1
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" The vrimeagens greates remap ever 
vnoremap <leader>p "_dp  " in visual mode replace current selection using black hole reg)

" close tag in instert mode 
imap ,/ </<C-X><C-O><Esc>F<i 

" fzf mappings 
"
" git tracked files
nmap <Leader>f :GFiles<CR> 
" find all files
nmap <Leader>F :Files<CR> 
" find bufferers
nmap <Leader>b :Buffers<CR>
" find in history
nmap <Leader>h :History<CR>
" find in current buffer
nmap <Leader>l :BLines<CR>
" find in all open buffers
nmap <Leader>L :Lines<CR>
" find in marks
nmap <Leader>' :Makrs<CR>
" find in vim s help
nmap <Leader>H :Helptags!<CR>

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

""------------------------------------------------------------------------
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

" Autostart netrw
""augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END
""------------------------------------------------------------------------
" gvim Settings
"------------------------------------------------------------------------
set guifont=Consolas:h10
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" fullscreen under windows
" https://vi.stackexchange.com/questions/1937/how-do-i-get-gvim-to-start-maximised-in-windows 
if g:os == "Windows"
  "run the command immediately when starting vim
  "autocmd VimEnter * call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)
  " activate/deactivate full screen with function key <F11>  
  map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

"------------------------------------------------------------------------

" --------------------------------------------------------------
" Installation of plug.vim
" --------------------------------------------------------------
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if g:os == "Linux" || g:os == "Darwin"
        if empty(glob('~/.vim/autoload/plug.vim'))
          silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
            \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
          autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
endif

"" man installation UNIX
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
"" man installation Windows Powershell
"iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
"    ni $HOME/vimfiles/autoload/plug.vim -Force
"

" --------------------------------------------------------------
" PlugIns
" --------------------------------------------------------------
call plug#begin($MYPLUGDIRECTORY)

Plug 'vim-airline/vim-airline'
Plug 'lervag/vimtex'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'psliwka/vim-smoothie'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'vimwiki/vimwiki'
"Plug 'mhinz/vim-startify'
Plug 'johngrib/vim-game-snake'
"Plug 'machakann/vim-highlightedyank'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/vim-peekaboo'"
"TESTING
"Plug 'wellle/targets.vim'
"Plug 'tpope/vim-obsession'
"Plug 'tmhedberg/SimpylFold'
"Plug 'Valloric/YouCompleteMe'
"Plug 'sainnhe/vim-color-atlantis'
"Plug 'chase/focuspoint-vim'
"Plug 'neoclide/coc.vim',{'branch': 'release'}
call plug#end()

"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" --------------------------------------------------------------
" vim-highlightedyank  configuration
" --------------------------------------------------------------
"let g:highlightedyank_highlight_duration = 150

" --------------------------------------------------------------
" peekaboo configuration   
" --------------------------------------------------------------
 "You can toggle fullscreen mode by pressing spacebar.

let g:peekaboo_window='vertical botright 60new'
let g:peekaboo_delay=10
let g:peekaboo_compact=0


" --------------------------------------------------------------
" startify configuration
" --------------------------------------------------------------
"
"let g:startify_custom_footer =
"           \ ['', "   Vim is charityware. Please read ':help uganda'.", '']
"
"let g:startify_skiplist = [
"                        \ '*.git',
"                        \ expand($VIMRUNTIME) . '/doc',
"                        \ '.vimrc',
"                       \ '_wiki\.*'
"                        \ ]
"" Startify Colors
"    hi StartifyBracket ctermfg=148
"    hi StartifyFile    ctermfg=147
"    hi StartifyFooter  ctermfg=240
"    hi StartifyHeader  ctermfg=114
"    hi StartifyNumber  ctermfg=215
"    hi StartifyPath    ctermfg=245
"    hi StartifySlash   ctermfg=245
"    hi StartifySpecial ctermfg=240
"
" --------------------------------------------------------------
