" No compatibility – necessary for mappings to work.
set nocompatible
filetype off

call plug#begin("~/.config/nvim/autoload")
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'MaciekBielski/vim-monokai'
call plug#end()

filetype plugin indent on
" Status line
set laststatus=0
set cmdheight=1
set nomodifiable " Only in version 6.0
set readonly
set number
set cursorline

" My xterms have a navy-blue background, so I need this line too.
set background=dark
syntax on
if get(g:, 'vim_monokai_loaded', 1)
    colorscheme monokai
endif

" Turn syntax on
syntax enable

" No menu bar and tool bar
set guioptions=aiMr

" Key bindings.
" nmap b <C-B><C-G>
" nmap q :q!<CR>
" nmap <Up> <C-Y>
" nmap <Down> <C-E>

" To type the following line, type *two* C-V's followed by two spaces. This
" is how you map the spacebar.
" nmap ^V <C-F><C-G>
