set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vimc/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/Vundle.vim'
Bundle 'altercation/vim-colors-solarized'

" my Bundles
" Bundle 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Bundle 'L9'
" Git plugin not hosted on GitHub
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Bundle 'user/L9', {'name': 'newL9'}

filetype plugin indent on
set nocp

" Enable syntax
if has("syntax")
  syntax on
endif

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

  " Auto read when a file is changed from the outside
set autoread

" Turn on the WiLd menu
set wildmenu

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

" Ignore case when searching
set ignorecase

" Highlight search results and remove the highlight when pressing enter
set hlsearch
" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set text width for Latex
" set tw=80

" Wrap lines
set wrap

" Sets how many lines of history VIM has to remember
set history=700

" Enables mouse
set mouse=a

" Enable line numbers
set number

" Enable clipboard
set clipboard=unnamedplus

" Auto copy text highlighted by mouse in Windows
set guioptions+=a

" Proper tab indent
set tabstop=2
set shiftwidth=2
set expandtab

" Auto indent
set ai

" Smart indent
set si

" Colorscheme and syntax highlighting
syntax enable
set term=screen-256color
set t_Co=256
set background=dark

if (match(system("ls ~/.vimc/.vim/bundle/ | grep vim-colors-solarized"), "vim-colors-solarized") != -1)
  let g:airline_theme='solarized'
  let g:solarized_termcolors=256
  colorscheme solarized
else
  colorscheme darkblue
endif

" Atomatic removal of trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Highlight redundant whitespaces
highlight RedundantWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match RedundantWhitespace /[^\t]\zs\t\+/
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Fix the difficult-to-read default setting for diff text highlighting.  The
" bang (!) is required since we are overwriting the DiffText setting. The highlighting
" for "Todo" also looks nice (yellow) if you don't like the "MatchParen" colors.
highlight! link DiffText MatchParen
