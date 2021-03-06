"General
set nocompatible " get out of vi-compatible mode

set backspace=indent,eol,start "allow backspacing over everything in insert mode

set history=1000 " How many command-lines of history to remember
set cf " enable error files and error jumping
set mouse=a " mouse always enabled
set noantialias " disable font anti aliasing
set showmode " show the current mode in the status line

colorscheme ir_black

syntax on " enable syntax highlighting

" Text Formatting -- General
set shiftwidth=2 " use indents of 2 spaces, and have them copied down lines
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set expandtab
set autoindent
set shiftround
set nowrap " prevent text wrapping

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" Vim UI
set number " show line numbers

if has("gui_running")
    "tell the term has 256 colors
    set t_Co=256

    set guioptions-=T "remove the tool bar

    "setting colorschema from http://github.com/twerth/dotfiles/blob/master/etc/vim/colors/ir_black.vim
    colorscheme ir_black

    if has("gui_mac") || has("gui_macvim")

        " key binding for Command-T to behave properly
        macmenu &File.New\ Tab key=<nop>
        map <D-t> :CommandT<CR>

        " make Mac's Option key behave as the Meta key
        set invmmta
    endif

    "starting NERDTree
    map <F3> :NERDTreeToggle<CR>

    " NerdTree settings
    let NERDTreeIgnore=['\~$', '\.swp$', '\.pyc$']
    set autoread
else
    "CSApprox http://www.vim.org/scripts/script.php?script_id=2390
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1
endif

" Searching
set ignorecase "ignorecase for search
set smartcase "case-sensitive if there are upper-case letters in the search pattern
set incsearch "find the next match as we type the search
set hlsearch "hilight searches by default

" Tab-Completion Settings
set wildmode=list:longest "make cmdline tab completion similar to bash
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.pyc,*.o,*.obj,*~ "stuff to ignore when tab completing

"necessary on some Linux distros for pathogen to properly load bundles
"also see exlpenation http://www.vim.org/scripts/script.php?script_id=2332
filetype off

"load pathogen managed plugins
"this is necessary to load the bundles in bundle folder
call pathogen#runtime_append_all_bundles()

" http://vimdoc.sourceforge.net/htmldoc/filetype.html
filetype on " enables filetype detection
filetype plugin on " enables filetype specific plugins (ftplugins)
filetype plugin indent on " enable loading the indent file for specific file types
