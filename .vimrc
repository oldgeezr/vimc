" Thanks to Arnstein!

set nocompatible
filetype off

" Setting up Vundle - the vim plugin manager
let installVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let installVundle=0
endif
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/vundle'
"Plugin 'Syntastic' "Syntax checker
Plugin 'altercation/vim-colors-solarized' "Colorscheme
"Plugin 'https://github.com/tpope/vim-fugitive' "Git + Vim = true
"Plugin 'tpope/vim-sensible' "Sensible vim
"Plugin 'scrooloose/syntastic' "Syntax checking
"Plugin 'tpope/vim-surround' "Easy surrounding fixing
"Plugin 'sjl/gundo.vim' "Visualization of Vim undo tree
"Plugin 'vim-scripts/SQLComplete.vim' "SQL syntax
"Plugin 'StanAngeloff/php.vim' "PHP syntax
"Plugin 'nachumk/systemverilog.vim'
"" SnipMate and dependencies
"Plugin 'honza/vim-snippets'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
" Plugin 'Valloric/YouCompleteMe' "YouCompleteMe autocomplete
"Plugin 'bling/vim-airline'
if installVundle == 0
    echo "Installing plugins, please ignore key map error messages"
    :PluginInstall
endif
call vundle#end()
filetype plugin indent on
set nocp

" Enable syntax
if has("syntax")
  syntax on
endif

" Airline theme
let g:airline_theme='solarized'

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
set tw=80

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
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

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
