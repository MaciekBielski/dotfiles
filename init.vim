
set nocompatible
filetype off

call plug#begin("~/.config/nvim/autoload")

Plug 'nelstrom/vim-markdown-folding'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'MaciekBielski/vim-airline-themes'
Plug 'joereynolds/gtags-scope'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'MaciekBielski/vim-monokai'
Plug 'MaciekBielski/my_ulti_snips'
Plug 'MaciekBielski/vim-window-resize-easy'
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
Plug 'vifm/vifm.vim'
Plug 'akinsho/toggleterm.nvim'

call plug#end()

filetype plugin indent on

lua require('opts')
lua require('keymap')
lua require('autocmds')
lua require('toggleterm').setup{
            \   float_opts = { border = 'rounded',
            \                  width = function() return math.floor(vim.o.columns * 0.99) end,
            \                  height = function() return math.floor(vim.o.lines * 0.94) end
            \                },
            \   highlights = { FloatBorder = { guifg = "#75715E", guibg = "#0f1111"} }
            \ }

" Enable in case of errors
" let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
" let $NVIM_PYTHON_LOG_LEVEL="DEBUG"

source ~/.config/nvim/functions.vim

"==================== Syntax coloring =========================="
lua vim.cmd.syntax('on')

if get(g:, 'vim_monokai_loaded', 1)
    colorscheme monokai
endif
set termguicolors

"==================== Per-project setup =========================="
" THIS HAS TO GO TO THE END
call SearchLocalVimrc()

" NOTE: The last line is there intentionally because 'silent" does not work in
" previous window
" autocmd FileType netrw,c,cpp nnoremap <leader>gv :silent !tmux split-window -h
"             \ 'cd <C-R>=getcwd()<CR>;
"                 \ _kword=$(echo '\''<C-R>=shellescape(expand('<cword>'))<CR>'\'')
"                 \ _tmp_out=$(
"                     \ cscope -d -R -L1 "$_kword"
"                     \ \| cut -d" " -f1,3-
"                     \ \| sed "s@ @:@; s@ @:\t@"
"                     \ \| fzf -q "$_kword" --ansi --delimiter=':'
"                     \ --preview="nvim -u $HOME/.config/nvim/init_pager.vim {1} +{2} -c '\'':norm zz'\'' -c '\'':redraw'\''"
"                         \ --preview-window="up:75\%" --sync
"                     \ \| cut -s -d":" -f1-2 --output-delimiter=" +");
"                 \ _full_path=$(echo "$_tmp_out" \| cut -s -d" " -f1);
"                 \ _line_num=$(echo "$_tmp_out" \| cut -s -d'+' -f2);
"                 \ _dir_path=$(dirname $_full_path);
"                 \ _file_path=$(basename $_full_path);
"                 \ vifm -c "cd <C-R>=getcwd()<CR>/$_dir_path"
"                 \ -c "\!nvim $_file_path +$_line_num"
"             \ '<CR>
"             \ :silent !tmux last-pane <CR>
"             \ :silent !tmux last-pane <CR>

" autocmd FileType netrw,c,cpp nnoremap <leader>gb :silent !tmux split-window
"             \ 'cd <C-R>=getcwd()<CR>;
"                 \ _kword=$(echo '\''<C-R>=shellescape(expand('<cword>'))<CR>'\'')
"                 \ _tmp_out=$(
"                     \ cscope -d -R -L1 "$_kword"
"                     \ \| cut -d" " -f1,3-
"                     \ \| sed "s@ @:@; s@ @:\t@"
"                     \ \| fzf -q "$_kword" --ansi --delimiter=':'
"                     \ --preview="nvim -u $HOME/.config/nvim/init_pager.vim {1} +{2} -c '\'':norm zz'\'' -c '\'':redraw'\''"
"                         \ --preview-window="up:75\%" --sync
"                     \ \| cut -s -d":" -f1-2 --output-delimiter=" +");
"                 \ _full_path=$(echo "$_tmp_out" \| cut -s -d" " -f1);
"                 \ _line_num=$(echo "$_tmp_out" \| cut -s -d'+' -f2);
"                 \ _dir_path=$(dirname $_full_path);
"                 \ _file_path=$(basename $_full_path);
"                 \ vifm -c "cd <C-R>=getcwd()<CR>/$_dir_path"
"                 \ -c "\!nvim $_file_path +$_line_num"
"             \ '<CR>
"             \ :silent !tmux last-pane <CR>
"             \ :silent !tmux last-pane <CR>

" autocmd FileType netrw,c,cpp nnoremap <leader>gg :silent !tmux respawn-pane -k
"             \ 'cd <C-R>=getcwd()<CR>;
"                 \ _kword=$(echo '\''<C-R>=shellescape(expand('<cword>'))<CR>'\'')
"                 \ _tmp_out=$(
"                     \ cscope -d -R -L1 "$_kword"
"                     \ \| cut -d" " -f1,3-
"                     \ \| sed "s@ @:@; s@ @:\t@"
"                     \ \| fzf -q "$_kword" --ansi --delimiter=':'
"                     \ --preview="nvim -u $HOME/.config/nvim/init_pager.vim {1} +{2} -c '\'':norm zz'\'' -c '\'':redraw'\''"
"                         \ --preview-window="up:75\%" --sync
"                     \ \| cut -s -d":" -f1-2 --output-delimiter=" +");
"                 \ _full_path=$(echo "$_tmp_out" \| cut -s -d" " -f1);
"                 \ _line_num=$(echo "$_tmp_out" \| cut -s -d'+' -f2);
"                 \ _dir_path=$(dirname $_full_path);
"                 \ _file_path=$(basename $_full_path);
"                 \ vifm -c "cd <C-R>=getcwd()<CR>/$_dir_path"
"                 \ -c "\!nvim $_file_path +$_line_num"
"             \ '<CR>
"             \ :silent !tmux last-pane <CR>
"             \ :silent !tmux last-pane <CR>

" autocmd FileType python,c,cpp nnoremap <leader>ff  :silent !tmux respawn-pane -k
"             \ 'cd <C-R>=getcwd()<CR>;
"                 \ _kword=$(echo '\''<C-R>=shellescape(expand('<cword>'))<CR>'\'')
"                 \ _tmp_out=$(rg --with-filename -n --no-heading --no-messages --color=ansi --colors='path:fg:cyan'
"                     \ -g"**/*.[chi]" -g"**/*.py" -g"**/*.py3" -g"**/*.rs"
"                     \ -g"**/*.hh" -g"**/*.cc" -g"**/*.cpp" -g"**/*.hpp"
"                     \ -g"**/*.inc" -g"**/*.inl"
"                     \ -g"**/*.bb" -g"**/*.bbappend" -g"**/*.sh" -g"**/*.txt"
"                     \ ""
"                     \ \| sed "s@<C-R>=getcwd()<CR>@.@g"
"                     \ \| fzf -q "$_kword" --ansi --delimiter=':'
"                     \ --preview="nvim -u $HOME/.config/nvim/init_pager.vim {1} +{2} -c '\'':norm zz'\'' -c '\'':redraw'\''"
"                         \ --preview-window="up:75\%" --sync
"                     \ \| cut -s -d":" -f1-2 --output-delimiter=" +");
"                 \ _full_path=$(echo "$_tmp_out" \| cut -s -d" " -f1);
"                 \ _line_num=$(echo "$_tmp_out" \| cut -s -d'+' -f2);
"                 \ _dir_path=$(dirname $_full_path);
"                 \ _file_path=$(basename $_full_path);
"                 \ vifm -c "cd <C-R>=getcwd()<CR>/$_dir_path"
"                 \ -c "\!nvim $_file_path +$_line_num"
"             \ '<CR>

" autocmd FileType python,c,cpp nnoremap <leader>fv  :silent !tmux split-window -h
"             \ 'cd <C-R>=getcwd()<CR>;
"                 \ _kword=$(echo '\''<C-R>=shellescape(expand('<cword>'))<CR>'\'')
"                 \ _tmp_out=$(rg --with-filename -n --no-heading --no-messages --color=ansi --colors='path:fg:cyan'
"                     \ -g"**/*.[chi]" -g"**/*.py" -g"**/*.py3" -g"**/*.rs"
"                     \ -g"**/*.hh" -g"**/*.cc" -g"**/*.cpp" -g"**/*.hpp"
"                     \ -g"**/*.inc" -g"**/*.inl"
"                     \ -g"**/*.bb" -g"**/*.bbappend" -g"**/*.sh" -g"**/*.txt"
"                     \ ""
"                     \ \| sed "s@<C-R>=getcwd()<CR>@.@g"
"                     \ \| fzf -q "$_kword" --ansi --delimiter=':'
"                     \ --preview="nvim -u $HOME/.config/nvim/init_pager.vim {1} +{2} -c '\'':norm zz'\'' -c '\'':redraw'\''"
"                         \ --preview-window="up:75\%" --sync
"                     \ \| cut -s -d":" -f1-2 --output-delimiter=" +");
"                 \ _full_path=$(echo "$_tmp_out" \| cut -s -d" " -f1);
"                 \ _line_num=$(echo "$_tmp_out" \| cut -s -d'+' -f2);
"                 \ _dir_path=$(dirname $_full_path);
"                 \ _file_path=$(basename $_full_path);
"                 \ vifm -c "cd <C-R>=getcwd()<CR>/$_dir_path"
"                 \ -c "\!nvim $_file_path +$_line_num"
"             \ '<CR>
"             \ :silent !tmux last-pane <CR>
"             \ :silent !tmux last-pane <CR>

" autocmd FileType python,c,cpp nnoremap <leader>fb  :silent !tmux split-window
"             \ 'cd <C-R>=getcwd()<CR>;
"                 \ _kword=$(echo '\''<C-R>=shellescape(expand('<cword>'))<CR>'\'')
"                 \ _tmp_out=$(rg --with-filename -n --no-heading --no-messages --color=ansi --colors='path:fg:cyan'
"                     \ -g"**/*.[chi]" -g"**/*.py" -g"**/*.py3" -g"**/*.rs"
"                     \ -g"**/*.hh" -g"**/*.cc" -g"**/*.cpp" -g"**/*.hpp"
"                     \ -g"**/*.inc" -g"**/*.inl"
"                     \ -g"**/*.bb" -g"**/*.bbappend" -g"**/*.sh" -g"**/*.txt"
"                     \ ""
"                     \ \| sed "s@<C-R>=getcwd()<CR>@.@g"
"                     \ \| fzf -q "$_kword" --ansi --delimiter=':'
"                     \ --preview="nvim -u $HOME/.config/nvim/init_pager.vim {1} +{2} -c '\'':norm zz'\'' -c '\'':redraw'\''"
"                         \ --preview-window="right:50\%" --sync
"                     \ \| cut -s -d":" -f1-2 --output-delimiter=" +");
"                 \ _full_path=$(echo "$_tmp_out" \| cut -s -d" " -f1);
"                 \ _line_num=$(echo "$_tmp_out" \| cut -s -d'+' -f2);
"                 \ _dir_path=$(dirname $_full_path);
"                 \ _file_path=$(basename $_full_path);
"                 \ vifm -c "cd <C-R>=getcwd()<CR>/$_dir_path"
"                 \ -c "\!nvim $_file_path +$_line_num"
"             \ '<CR>
"             \ :silent !tmux last-pane <CR>
"             \ :silent !tmux last-pane <CR>

" nnoremap <leader>gq :!tmux kill-pane<CR>

" nnoremap <leader>v :silent !tmux split-window -h
"             \ 'vifm -c "cd <C-R>=shellescape(expand('%:p:h'))<CR>" -c
"             \ "\!nvim +<C-R>=line(".")<CR> <C-R>=shellescape(expand('%:p'))<CR>"'<CR><CR>
" nnoremap <leader>b :silent !tmux split-window
"             \ 'vifm -c "cd <C-R>=shellescape(expand('%:p:h'))<CR>" -c
"             \ "\!nvim +<C-R>=line(".")<CR> <C-R>=shellescape(expand('%:p'))<CR>"'<CR><CR>


" the combination below is <C-/> for me
" nnoremap  :silent !tmux split-window -h 'nvim ~/.config/nvim/init.vim'<CR>

"==================== thesaurus_query =========================="
" autocmd FileType markdown,tex,plaintex let g:tq_mthesaur_file="/usr/share/dict/mthesaur.txt"
" autocmd FileType markdown,tex,plaintex let g:tq_enabled_backends=["mthesaur_txt"]
" autocmd FileType markdown,tex,plaintex let g:tq_map_keys=0
" autocmd FileType markdown,tex,plaintex let g:tq_use_vim_autocomplete=1
" autocmd FileType markdown,tex,plaintex inoremap <expr> <leader>r pumvisible() ? "" : "\<C-x><C-u>"
" autocmd FileType markdown,tex,plaintex nnoremap <leader>r :ThesaurusQueryReplaceCurrentWord<CR>
" autocmd FileType markdown,tex,plaintex vnoremap <Leader>r "ky:ThesaurusQueryReplace <C-r>"<CR>
