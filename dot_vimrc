" Modeline {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker:
" }
" Notes {
"
" Originally built from SPF13
" Merged with vim-sensible
" Then with YADR
" Some extra personal modifications
" }
" VIM Mode {
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible  " be iMproved
" }

" The default leader is '\', but many people prefer ',' as it's in a standard
" location.
" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" Install vim-plug {
    if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall | source $MYVIMRC
    endif
" }

" Use plug config {
    if filereadable(expand("~/.vim-plugins"))
        call plug#begin('~/.plugged')
        source ~/.vim-plugins
        call plug#end()
    endif
" }

" Filetype {
" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
" Turn on filetype detection, plugins, and indent
filetype on
filetype indent on
filetype plugin on
" }
" Syntax {

" Syntax highlighting
syntax on
syntax enable

" }
" Encoding {

scriptencoding utf-8
set encoding=utf-8

" }
" Settings {
" Cursor {

" Highlight current line
set cursorline

" Keep cursor in same column for long-range motion commands
set nostartofline

" }
" Auto {

" Automatically re-read files changed outside of Vim
set autoread

" Automatically write a file when leaving a modified buffer
set autowrite

" }
" Mouse {

" Automatically enable mouse usage
set mouse=a

" Hide the mouse cursor while typing
set mousehide

" }
" Line spacing {

" No extra spaces between rows
set linespace=0

" }
" Wrap {

set textwidth=80

" Wrap long lines
set nowrap

" Backspace and cursor keys wrap too
set whichwrap=b,s,h,l,<,>,[,]

" For lines longer than the window, wrap intelligently.
" This doesn't insert hard line breaks.
set linebreak

" String to put before wrapped screen lines
"set showbreak=↪\ \

" }
" Tabs {
set showtabline=0         " Turn off tabline
set autoindent            " Indent at the same level of the previous line
set smartindent
set smarttab              " <TAB> in front of line inserts 'shiftwidth' blanks
"set nosmarttab
set shiftround            " Round to 'shiftwidth' for "<<" and ">>"
set expandtab             " Tabs are spaces, not tabs
set tabstop=4             " An indentation every four columns
set softtabstop=4         " Let backspace delete indent
set shiftwidth=4
set tabpagemax=15         " Only show 15 tabs
" }
" Scrolling {
set scrolljump=5      " Lines to scroll when cursor leaves screen
set scrolloff=3       " Minimum lines to keep above and below cursor
set sidescrolloff=2   " Minimum number of columns to keep left/right of cursor
" }
" Folding {
set foldenable                  " Auto fold code
set foldcolumn=1
" }
" Line numbers {
set nonumber                          " Line numbers on
set norelativenumber                  " Relative line numbers on
set numberwidth=4
" }
" Color column {
set colorcolumn=0
" }
" Conceal {
set conceallevel=2
set concealcursor=nc
" }
" Spelling {
set nospell                           " Spell checking on
set spelllang=en_us
" }
" Search {
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when searching with uppercase
set gdefault                    " For :substitute, use the /g flag by default
"}
" Wild menu {

"set complete-=i

" Show list instead of just completing
"set wildmenu                    " Show list instead of just completing

" Command <Tab> completion, list matches, then longest common part, then all.
"set wildmode=list:longest,full

" }
" List {

set list

" Highlight problematic whitespace
set listchars=tab:›\ ,trail:•,precedes:<,extends:#,nbsp:.

" }
" Buffers {

" Allow buffer switching without saving.
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" }
" History {
set history=1000                    " Store a ton of history (default is 20)
" }
" Windows {

set winminheight=0              " Windows can be 0 line high

set splitbelow
set splitright

" }
" View {

" Better Unix / Windows compatibility
set viewoptions=folds,options,cursor,unix,slash

" }
" Timeouts {

" Mapping delay
set timeoutlen=1000

" Key code delay
set ttimeoutlen=0

" }
" Editing {

" Allow for cursor beyond last character
set virtualedit=onemore

" Use only one space after '.' when joining lines, instead of two
set nojoinspaces

" Backspace over autoindent, line breaks, start of insert
" (see :help 'backspace')
set backspace=indent,eol,start

" }
" Clipboard {

" Link the system clipboard with the unnamed (*) and unnamedplus (+) registers
set clipboard=unnamed,unnamedplus

" Visual selection automatically copied to the clipboard
set go+=a

" }
" Ruler {
if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                " Selected characters/lines in visual mode
endif
" }
" Commandline {

" Number of lines for the command window
" cmdheight=2 helps avoid 'Press ENTER...' prompts
set cmdheight=2

" }
" Status line {
" if has('statusline')
"     set laststatus=2
"
"     " Broken down into easily includeable segments
"     set statusline=%<%f\                     " Filename
"     set statusline+=%w%h%m%r                 " Options
"     set statusline+=%{fugitive#statusline()} " Git Hotness
"     set statusline+=\ [%{&ff}/%Y]            " Filetype
"     set statusline+=\ [%{getcwd()}]          " Current dir
"     set statusline+=%#warningmsg#
"     set statusline+=%{SyntasticStatuslineFlag()}  " Syntastic Goodness
"     set statusline+=%*
"     set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
" endif
" }
" Misc {
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set showmatch                   " Show matching brackets/parenthesis
"set matchpairs+=<:>             " Match, to be used with %
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
set display+=lastline " show last line, even if it doesn't fit in the window


set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

"set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize

"set completeopt-=preview
set completeopt+=menu,menuone " better omni-complete menu

set formatoptions+=j    " delete comment char on second line when
                        " joining two commented lines
set nrformats-=octal      " don't treat numbers with leading zeros as octal
                          " when incrementing/decrementing
                          "
                          "

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic



" abbrev. of messages (avoids 'hit enter')
set shortmess+=cfilmnrxoOtTA

" current directory is always matching the
" content of the active window
" set autochdir

set belloff=all " Disable audio and visual bells
"
" }
" }

" Mappings {

" Consistency {

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" }

" Useful {

" Use `'` to repeat last `;` in reverse (default is `,`)
nnoremap ' ,

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" gi moves to last insert mode
" gI moves to last modification
nnoremap gI `.

" Jump to start and end of line using the home row keys
map H ^
map L $

" ` is more useful than ' but less accessible.
nnoremap ' `
nnoremap ` '

nnoremap & :&&<CR>
xnoremap & :&&<CR>

" }

" Typos {

" Fix command typos (stolen from Adam Katz)
nnoremap ; :

" Easier horizontal scrolling
map zl zL
map zh zH

" Stupid SHIFT key mistakes
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>

cmap Tabe tabe

" }

" Function Keys {

nnoremap <F8> :TagbarToggle<CR>
nnoremap <F9> :VimChat<CR>
nnoremap <F10> :FriendsTwitter<CR>

" }

" Leader {

" <Leader> F1-F9 {

" Code folding options
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

" }

" <Leader> 1-9 {
" Switching to buffer 1 - 9 is mapped to <Leader> [Buffer number]
for buffer_no in range(1, 9)
  execute "nmap <Leader>" . buffer_no . " :b" . buffer_no . "\<CR>"
endfor
" }

" <Leader> A-Z {

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <leader>t :e term://zsh<cr>i

" GitV
nmap <leader>gv :Gitv --all<cr>
nmap <leader>gV :Gitv! --all<cr>
vmap <leader>gV :Gitv! --all<cr>

" Fast saving
nmap <leader>w :w!<cr>

" }

" <Leader> Other {

" Adjust viewports to the same size
map <Leader>= <C-w>=

" }

" }

" BACKSLASH Modifier {

nmap \b :set <C-R>=&laststatus == 0 ? 'laststatus=2' : 'laststatus=0'<CR><CR>
nmap \c :setlocal cursorline!<CR>
nmap \d :SignifyToggleHighlight<CR>
nmap \e :setlocal <C-R>=&colorcolumn == '0' ? 'colorcolumn=+1 formatoptions+=t' : 'colorcolumn=0 formatoptions-=t' <CR><CR>
nmap \f :setlocal <C-R>=&foldcolumn == 1 ? 'foldcolumn=0' : 'foldcolumn=1'<CR><CR>
nmap \l :setlocal number!<CR>:setlocal relativenumber!<CR>:setlocal number?<CR>:setlocal relativenumber?<CR>
nmap \n :setlocal number!<CR>:setlocal number?<CR>
nmap \m :MatchmakerToggle<CR>
nmap \p :set paste!<CR>
nmap \q :SignifyToggle<CR>
nmap \r :setlocal relativenumber!<CR>:setlocal relativenumber?<CR>
nmap \s :setlocal invspell<CR>
nmap \t :<C-u>call ShowTrailingWhitespace#Toggle(0)<Bar>echo (ShowTrailingWhitespace#IsSet() ? 'Show trailing whitespace' : 'Not showing trailing whitespace')<CR>
nmap \u :setlocal list!<CR>:setlocal list?<CR>
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap \x :setlocal cursorcolumn!<CR>
nmap \y :SyntasticToggle<CR>
nmap \/ :setlocal invhlsearch<CR>

" }

" ALT Modifier {

" Add mapping for moving between windows with ALT-<arrow keys> "
nmap <silent> <A-Up>    :wincmd k<CR>
nmap <silent> <A-Down>  :wincmd j<CR>
nmap <silent> <A-Left>  :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

if has('nvim')
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
endif

" }

" CTRL Modifier {

" In command-line mode, C-a jumps to beginning (to match C-e).
cnoremap <C-a> <Home>

" Select all
map <C-a> ggVG

" Easier moving in tabs and windows
" The lines conflict with the default digraph mapping of <C-K>
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-L> <C-W>l<C-W>
map <C-H> <C-W>h<C-W>

" }

" SHIFT Modifier {

nnoremap <S-U> :GundoToggle<CR>

" }

" Misc {

nnoremap <silent> gb :exe('!w3m "'.expand('<cfile>').'"')<CR>

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

" }

" }

" Abbreviations {
" Commands {

cabbrev git Git

" }
" Replacements {

iabbrev --- —
iabbrev ... …

" }
" }

" VIM Folders {

" Ensure directory exists
function! EnsureDirExists (dir)
  if !isdirectory(a:dir)
    if exists('*mkdir')
      silent call mkdir(a:dir, 'p')
    endif
  endif
endfunction

" Make folders if they dont exist
call EnsureDirExists($HOME.'/.vim/tags')
call EnsureDirExists($HOME.'/.vim/undo')
call EnsureDirExists($HOME.'/.vim/view')
call EnsureDirExists($HOME.'/.vim/swap')
call EnsureDirExists($HOME.'/.vim/backup')

" Tags
set tags=./tags,tags,~/.vim/tags

" Spelling
set spellfile=~/.vim/spell/en.utf-8.add

" Persistent undo
set undofile
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
set undodir=~/.vim/undo,.

" Views
set viewdir=~/.vim/view,.

"" Backups
set backup
set backupdir=~/.vim/backup,.

"" Swap files
set swapfile
set directory=~/.vim/swap,.

" }

set ttyfast

set termguicolors

"
" Theme
silent! colorscheme jason

