set nocompatible
filetype off

call plug#begin("~/.config/nvim/autoload")

Plug 'nelstrom/vim-markdown-folding'
" For seeing git branch in the footer
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joereynolds/gtags-scope'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'MaciekBielski/vim-monokai'
Plug 'MaciekBielski/my_ulti_snips'
Plug 'SirVer/ultisnips'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'jreybert/vimagit'
" Plug 'ron89/thesaurus_query.vim'
Plug 'tpope/vim-commentary'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'JuliaEditorSupport/julia-vim'

call plug#end()

filetype plugin indent on

" Enable in case of errors
" let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
" let $NVIM_PYTHON_LOG_LEVEL="DEBUG"

source ~/.config/nvim/functions.vim

"==================== Standard setup =========================="
"
set spelllang=en_us
set noswapfile
" window behavior
set switchbuf=useopen
set noea
" those commands does not work like there are named, hidden without autowrite
" causes issues with erasing a buffer when was hidden unsaved
" with autowrite it is not saved automatically but the content is remembered
set hidden
set autowrite
set nosplitbelow
set splitright
set cursorline
" set autochdir
set hlsearch
set complete+=k
set dictionary+=/usr/share/dict/american-english
" thesaurus from:http://www.gutenberg.org/files/3202/files/ has wrong format
"
"set thesaurus+=/usr/share/dict/mthesaur.txt
set completeopt=menu,menuone,noinsert
set showfulltag
set number
set nowrapscan
"set ruler "disabled for gonvim
set cmdheight=1
set laststatus=2
set showcmd
set tabstop=4
set expandtab
set softtabstop=0 "set tab columns
set shiftwidth=0 "use ts for that
set incsearch
set nobackup
set list
set listchars=tab:▸\ ,trail:·,nbsp:+
" check for and load file changes if edited from two tmux panes
set updatetime=600
call timer_start(1000, function('ChecktimePeriodic'), {'repeat': -1})

set showmatch
set matchtime=3
set pastetoggle=<F3>
set textwidth=80
set copyindent
set autoread
set nosmarttab
set ignorecase
set smartindent
set clipboard+=unnamedplus
"NOTE: Either curdir or sessdir
set sessionoptions=curdir,localoptions,options
" set sessionoptions=sessdir
set cscopetag
set nocscopeverbose
set foldlevel=42

let g:python_host_prog='/usr/bin/python3'
let g:python3_host_prog='/usr/bin/python3'
let g:markdown_fold_style = 'nested'

autocmd FileType c,cpp set completeopt=noinsert,menuone,noselect
autocmd BufEnter * :call SetFiletypeNewBuffer()
autocmd BufEnter,BufNewFile,BufRead *.s,*.S set ft=ia64
autocmd BufEnter,BufNewFile,BufRead *.ld set ft=ld
autocmd BufEnter,BufNewFile,BufRead *.h,*.c,*.i set ft=c
autocmd FileType ia64 setlocal cindent tabstop=16
autocmd FileType c setlocal cindent tabstop=4 colorcolumn=81
autocmd FileType cpp setlocal cindent tabstop=4 colorcolumn=121 tw=120
autocmd FileType python setlocal tabstop=4
autocmd FileType c,cpp set commentstring=//\ %s
autocmd FileType c,cpp setlocal foldmethod=syntax cinoptions=n1sLs:0l1g0.5sh0.5st0(0u0U0
autocmd FileType tex,plaintex setlocal foldmethod=syntax
            \ textwidth=0 formatoptions=jclro
autocmd FileType python setlocal foldmethod=indent
autocmd FileType markdown,text set mouse=nv
autocmd FileType markdown,text,gitcommit set
    \ autoindent nocindent smartindent
    \ cinwords=''
    \ formatoptions-=2 formatoptions+=t1nq
    \ formatlistpat=^\\s*\\(\\d\\+[\\]:.)}\\t\ ]\\|[-\\*]\\)\\s*
autocmd FileType gitcommit set tw=72 colorcolumn=73
autocmd FileType c,cpp call SearchCscopeDBAndSetupRoot("cscope.out")
autocmd FileType python call SearchPythonRoot(".root.proj")
" autocmd TermOpen * set nonumber
" autocmd TermClose * set number


" noremap <leader>t :terminal<CR>i
noremap <leader>t :call ToggleReadOnly()<CR>
nnoremap gs     :setlocal spell!<CR>
nnoremap gw     :ToggleWhitespace<CR>
nnoremap <Space> za

"==================== Navigation shortcuts ==================================="
nnoremap \s     :wall <CR>
nnoremap \w     <C-W>
nnoremap ]]     ]]zt<C-Y><C-Y><C-Y>
nnoremap []     []
nnoremap ][     ][
nnoremap [[     [[zt5<C-Y>
nnoremap <leader>q :q<CR>
" more natural for wrapped lines
nnoremap j gj
nnoremap k gk
"more convenient scrolling
map <A-m> <C-E>
map <A-,> <C-Y>
map <A-u> <C-d>
map <A-i> <C-u>
nnoremap <A-h> <C-w>h
nnoremap <A-l> <C-w>l
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
" switching buffers
autocmd FileType c,cpp noremap <A-]>    :bn<CR>
autocmd FileType c,cpp noremap <A-[>    :bp<CR>
nmap <silent> ,/ :nohlsearch<CR>
cmap w!! w !sudo tee % >/dev/null

cnoremap vh <c-r>=(getcmdtype()==":" && getcmdpos()==1 ? "vertical help" : "vh")<CR>
cmap <leader>r <C-r>

" window resize \z \x
nnoremap <leader>z <ESC>10<c-w>>
nnoremap <leader>x <ESC>10<c-w><

" remappng the * so that it does not jump to next occurrence
nnoremap * :let @/=expand("<cword>")<CR> :set hlsearch<CR>

autocmd FileType markdown,tex,plaintex inoremap <expr> <C-Space> pumvisible() ? "" : "\<C-x><C-k>"
"autocmd FileType markdown,tex,plaintex inoremap <expr> <leader>r pumvisible() ? "" : "\<C-x><C-t>"

" NOTE: The last line is there intentionally because 'silent" does not work in
" previous window
autocmd FileType netrw,c,cpp nnoremap <leader>gv :silent !tmux split-window -h
            \ 'cd <C-R>=getcwd()<CR>;
                \ _kword=$(echo '\''<C-R>=shellescape(expand('<cword>'))<CR>'\'')
                \ _tmp_out=$(
                    \ cscope -d -R -L1 "$_kword"
                    \ \| cut -d" " -f1,3-
                    \ \| sed "s@ @:@; s@ @:\t@"
                    \ \| fzf -q "$_kword" --ansi --delimiter=':'
                    \ --preview="nvim -u $HOME/.config/nvim/init_pager.vim {1} +{2} -c '\'':norm zz'\'' -c '\'':redraw'\''"
                        \ --preview-window="up:75\%" --sync
                    \ \| cut -s -d":" -f1-2 --output-delimiter=" +");
                \ _full_path=$(echo "$_tmp_out" \| cut -s -d" " -f1);
                \ _line_num=$(echo "$_tmp_out" \| cut -s -d'+' -f2);
                \ _dir_path=$(dirname $_full_path);
                \ _file_path=$(basename $_full_path);
                \ vifm -c "cd <C-R>=getcwd()<CR>/$_dir_path"
                \ -c "\!nvim $_file_path +$_line_num"
            \ '<CR>
            \ :silent !tmux last-pane <CR>
            \ :silent !tmux last-pane <CR>

autocmd FileType netrw,c,cpp nnoremap <leader>gb :silent !tmux split-window
            \ 'cd <C-R>=getcwd()<CR>;
                \ _kword=$(echo '\''<C-R>=shellescape(expand('<cword>'))<CR>'\'')
                \ _tmp_out=$(
                    \ cscope -d -R -L1 "$_kword"
                    \ \| cut -d" " -f1,3-
                    \ \| sed "s@ @:@; s@ @:\t@"
                    \ \| fzf -q "$_kword" --ansi --delimiter=':'
                    \ --preview="nvim -u $HOME/.config/nvim/init_pager.vim {1} +{2} -c '\'':norm zz'\'' -c '\'':redraw'\''"
                        \ --preview-window="up:75\%" --sync
                    \ \| cut -s -d":" -f1-2 --output-delimiter=" +");
                \ _full_path=$(echo "$_tmp_out" \| cut -s -d" " -f1);
                \ _line_num=$(echo "$_tmp_out" \| cut -s -d'+' -f2);
                \ _dir_path=$(dirname $_full_path);
                \ _file_path=$(basename $_full_path);
                \ vifm -c "cd <C-R>=getcwd()<CR>/$_dir_path"
                \ -c "\!nvim $_file_path +$_line_num"
            \ '<CR>
            \ :silent !tmux last-pane <CR>
            \ :silent !tmux last-pane <CR>

autocmd FileType netrw,c,cpp nnoremap <leader>gg :silent !tmux respawn-pane -k
            \ 'cd <C-R>=getcwd()<CR>;
                \ _kword=$(echo '\''<C-R>=shellescape(expand('<cword>'))<CR>'\'')
                \ _tmp_out=$(
                    \ cscope -d -R -L1 "$_kword"
                    \ \| cut -d" " -f1,3-
                    \ \| sed "s@ @:@; s@ @:\t@"
                    \ \| fzf -q "$_kword" --ansi --delimiter=':'
                    \ --preview="nvim -u $HOME/.config/nvim/init_pager.vim {1} +{2} -c '\'':norm zz'\'' -c '\'':redraw'\''"
                        \ --preview-window="up:75\%" --sync
                    \ \| cut -s -d":" -f1-2 --output-delimiter=" +");
                \ _full_path=$(echo "$_tmp_out" \| cut -s -d" " -f1);
                \ _line_num=$(echo "$_tmp_out" \| cut -s -d'+' -f2);
                \ _dir_path=$(dirname $_full_path);
                \ _file_path=$(basename $_full_path);
                \ vifm -c "cd <C-R>=getcwd()<CR>/$_dir_path"
                \ -c "\!nvim $_file_path +$_line_num"
            \ '<CR>
            \ :silent !tmux last-pane <CR>
            \ :silent !tmux last-pane <CR>

autocmd FileType python,c,cpp nnoremap <leader>ff  :silent !tmux respawn-pane -k
            \ 'cd <C-R>=getcwd()<CR>;
                \ _kword=$(echo '\''<C-R>=shellescape(expand('<cword>'))<CR>'\'')
                \ _tmp_out=$(rg --with-filename -n --no-heading --no-messages --color=ansi --colors='path:fg:cyan'
                    \ -g"**/*.[chi]" -g"**/*.py" -g"**/*.py3" -g"**/*.rs"
                    \ -g"**/*.hh" -g"**/*.cc" -g"**/*.cpp" -g"**/*.hpp"
                    \ -g"**/*.inc" -g"**/*.inl"
                    \ -g"**/*.bb" -g"**/*.bbappend" -g"**/*.sh" -g"**/*.txt"
                    \ ""
                    \ \| sed "s@<C-R>=getcwd()<CR>@.@g"
                    \ \| fzf -q "$_kword" --ansi --delimiter=':'
                    \ --preview="nvim -u $HOME/.config/nvim/init_pager.vim {1} +{2} -c '\'':norm zz'\'' -c '\'':redraw'\''"
                        \ --preview-window="up:75\%" --sync
                    \ \| cut -s -d":" -f1-2 --output-delimiter=" +");
                \ _full_path=$(echo "$_tmp_out" \| cut -s -d" " -f1);
                \ _line_num=$(echo "$_tmp_out" \| cut -s -d'+' -f2);
                \ _dir_path=$(dirname $_full_path);
                \ _file_path=$(basename $_full_path);
                \ vifm -c "cd <C-R>=getcwd()<CR>/$_dir_path"
                \ -c "\!nvim $_file_path +$_line_num"
            \ '<CR>

autocmd FileType python,c,cpp nnoremap <leader>fv  :silent !tmux split-window -h
            \ 'cd <C-R>=getcwd()<CR>;
                \ _kword=$(echo '\''<C-R>=shellescape(expand('<cword>'))<CR>'\'')
                \ _tmp_out=$(rg --with-filename -n --no-heading --no-messages --color=ansi --colors='path:fg:cyan'
                    \ -g"**/*.[chi]" -g"**/*.py" -g"**/*.py3" -g"**/*.rs"
                    \ -g"**/*.hh" -g"**/*.cc" -g"**/*.cpp" -g"**/*.hpp"
                    \ -g"**/*.inc" -g"**/*.inl"
                    \ -g"**/*.bb" -g"**/*.bbappend" -g"**/*.sh" -g"**/*.txt"
                    \ ""
                    \ \| sed "s@<C-R>=getcwd()<CR>@.@g"
                    \ \| fzf -q "$_kword" --ansi --delimiter=':'
                    \ --preview="nvim -u $HOME/.config/nvim/init_pager.vim {1} +{2} -c '\'':norm zz'\'' -c '\'':redraw'\''"
                        \ --preview-window="up:75\%" --sync
                    \ \| cut -s -d":" -f1-2 --output-delimiter=" +");
                \ _full_path=$(echo "$_tmp_out" \| cut -s -d" " -f1);
                \ _line_num=$(echo "$_tmp_out" \| cut -s -d'+' -f2);
                \ _dir_path=$(dirname $_full_path);
                \ _file_path=$(basename $_full_path);
                \ vifm -c "cd <C-R>=getcwd()<CR>/$_dir_path"
                \ -c "\!nvim $_file_path +$_line_num"
            \ '<CR>
            \ :silent !tmux last-pane <CR>
            \ :silent !tmux last-pane <CR>

autocmd FileType python,c,cpp nnoremap <leader>fb  :silent !tmux split-window
            \ 'cd <C-R>=getcwd()<CR>;
                \ _kword=$(echo '\''<C-R>=shellescape(expand('<cword>'))<CR>'\'')
                \ _tmp_out=$(rg --with-filename -n --no-heading --no-messages --color=ansi --colors='path:fg:cyan'
                    \ -g"**/*.[chi]" -g"**/*.py" -g"**/*.py3" -g"**/*.rs"
                    \ -g"**/*.hh" -g"**/*.cc" -g"**/*.cpp" -g"**/*.hpp"
                    \ -g"**/*.inc" -g"**/*.inl"
                    \ -g"**/*.bb" -g"**/*.bbappend" -g"**/*.sh" -g"**/*.txt"
                    \ ""
                    \ \| sed "s@<C-R>=getcwd()<CR>@.@g"
                    \ \| fzf -q "$_kword" --ansi --delimiter=':'
                    \ --preview="nvim -u $HOME/.config/nvim/init_pager.vim {1} +{2} -c '\'':norm zz'\'' -c '\'':redraw'\''"
                        \ --preview-window="right:50\%" --sync
                    \ \| cut -s -d":" -f1-2 --output-delimiter=" +");
                \ _full_path=$(echo "$_tmp_out" \| cut -s -d" " -f1);
                \ _line_num=$(echo "$_tmp_out" \| cut -s -d'+' -f2);
                \ _dir_path=$(dirname $_full_path);
                \ _file_path=$(basename $_full_path);
                \ vifm -c "cd <C-R>=getcwd()<CR>/$_dir_path"
                \ -c "\!nvim $_file_path +$_line_num"
            \ '<CR>
            \ :silent !tmux last-pane <CR>
            \ :silent !tmux last-pane <CR>

nnoremap <leader>gq :!tmux kill-pane<CR>

nnoremap <leader>v :silent !tmux split-window -h
            \ 'vifm -c "cd <C-R>=shellescape(expand('%:p:h'))<CR>" -c
            \ "\!nvim +<C-R>=line(".")<CR> <C-R>=shellescape(expand('%:p'))<CR>"'<CR><CR>
nnoremap <leader>b :silent !tmux split-window
            \ 'vifm -c "cd <C-R>=shellescape(expand('%:p:h'))<CR>" -c
            \ "\!nvim +<C-R>=line(".")<CR> <C-R>=shellescape(expand('%:p'))<CR>"'<CR><CR>


" the combination below is <C-/> for me
nnoremap  :silent !tmux split-window -h 'nvim ~/.config/nvim/init.vim'<CR>
"
"
" NOTE: NOT used anymore as they don't update parent dir and when you quit you land in
" the wrong place
" the additional space before <C-R> is there intentionally
" autocmd FileType c,cpp nnoremap <A-1> :cs find g <C-R>=expand("<cword>")<CR><CR> <Space>zt
" autocmd FileType c,cpp nnoremap <A-2> :cs find c <C-R>=expand("<cword>")<CR><CR> <Space>zt
" autocmd FileType c,cpp nnoremap <A-3> :cs find s <C-R>=expand("<cword>")<CR><CR> <Space>zt
" autocmd FileType c,cpp nnoremap <A-4> :cs find e <C-R>=expand("<cword>")<CR><CR> <Space>zt

" autocmd FileType c,cpp nnoremap <A-7> :cs find f <C-R>=expand("<cfile>")<CR><CR> <Space>
" autocmd FileType c,cpp nnoremap <A-8> :cs find i <C-R>=expand("<cfile>")<CR><CR> <Space>
autocmd FileType c,cpp nnoremap <A-9>   :cs find

autocmd FileType c,cpp nnoremap <A-0>   <C-t>zz
autocmd FileType c,cpp nnoremap <A-r> :call ToggleQuickFix()<CR>

"==================== thesaurus_query =========================="
autocmd FileType markdown,tex,plaintex let g:tq_mthesaur_file="/usr/share/dict/mthesaur.txt"
autocmd FileType markdown,tex,plaintex let g:tq_enabled_backends=["mthesaur_txt"]
autocmd FileType markdown,tex,plaintex let g:tq_map_keys=0
autocmd FileType markdown,tex,plaintex let g:tq_use_vim_autocomplete=1
autocmd FileType markdown,tex,plaintex inoremap <expr> <leader>r pumvisible() ? "" : "\<C-x><C-u>"
autocmd FileType markdown,tex,plaintex nnoremap <leader>r :ThesaurusQueryReplaceCurrentWord<CR>
autocmd FileType markdown,tex,plaintex vnoremap <Leader>r "ky:ThesaurusQueryReplace <C-r>"<CR>


"==================== Snippets =========================="
let g:UltiSnipsExpandTrigger="<C-k>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<A-l>"
let g:UltiSnipsJumpBackwardTrigger="<A-h>"

"
"==================== Pairs =========================="
let g:delimitMate_expand_cr=0
let g:delimitMate_balance_matchpairs=1
"
"==================== Vimagit =========================="
let g:magit_default_fold_level=1
let g:magit_commit_title_limit=80
let g:magit_auto_foldopen=0
nnoremap <leader>n     :MagitOnly<CR>
nnoremap <leader>m  :silent !tmux split-window -h
            \ 'cd <C-R>=getcwd()<CR> &&
            \ nvim +<C-R>=line(".")<CR>
            \ -c "MagitOnly"
            \ <C-R>=expand('%:p')<CR>'<CR>

"==================== Vim-commentary =========================="
xmap <leader>c  <Plug>Commentary
nmap <leader>c  <Plug>Commentary
omap <leader>c  <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine
if maparg('c','n') ==# ''
  nmap c<leader>c <Plug>ChangeCommentary
endif
nmap <leader>cu <Plug>Commentary<Plug>Commentary


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline and whitespaces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " airline - status line configuration
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = '(no branch)'
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
let g:airline#extensions#vimagit#enabled = 1
let g:airline#extensions#branch#sha1_len = 8
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_detect_spell=0
let g:airline_theme='serene'
let g:airline_powerline_fonts=0
let g:airline_skip_empty_sections=0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'z']
    \ ]

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
" unicode symbols
"let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
let g:airline_right_sep = ' '
let g:airline_left_sep = ' '

"==================== Syntax coloring =========================="
set background=dark
syntax on
if get(g:, 'vim_monokai_loaded', 1)
    colorscheme monokai
endif

"==================== Per-project setup =========================="
" THIS HAS TO GO TO THE END
call SearchLocalVimrc()

