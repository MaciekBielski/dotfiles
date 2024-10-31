vim.opt.spelllang = en_us
vim.opt.swapfile = false
vim.opt.switchbuf = 'useopen'
vim.opt.ea = false
-- those commands does not work like there are named, hidden without autowrite
-- causes issues with erasing a buffer when was hidden unsaved
-- with autowrite it is not saved automatically but the content is remembered
vim.opt.hidden = true
vim.opt.autowrite = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.complete:append('k')
vim.opt.dictionary:append('/usr/share/dict/american-english')
-- thesaurus from:http://www.gutenberg.org/files/3202/files/ has wrong format
--set thesaurus+=/usr/share/dict/mthesaur.txt
vim.opt.completeopt = 'menu,menuone,noinsert'
vim.opt.showfulltag = true
vim.opt.number = true
vim.opt.wrapscan = false
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 0 --use ts for that
vim.opt.incsearch = true
vim.opt.backup = false
vim.opt.list = true
vim.opt.listchars = 'tab:▸ ,trail:·,nbsp:+'
vim.opt.showmatch = true
vim.opt.matchtime = 3
vim.opt.pastetoggle = '<F3>'
vim.opt.textwidth = 80
vim.opt.copyindent = true
vim.opt.autoread = true
vim.opt.smarttab = false
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.clipboard:append('unnamedplus')
-- vim.opt.cscopetag = true
-- vim.opt.cscopeverbose = false
vim.opt.foldlevel = 42
vim.opt.background = 'dark'

-- "NOTE: Either curdir or sessdir
-- set sessionoptions=curdir,localoptions,options
-- " set sessionoptions=sessdir

-- check for and load file changes if edited from two tmux panes
-- set updatetime=600
-- call timer_start(1000, function('ChecktimePeriodic'), {'repeat': -1})

vim.g.python_host_prog = '/usr/bin/python3'
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.markdown_fold_style = 'nested'

vim.g.UltiSnipsExpandTrigger = "<C-k>"
vim.g.UltiSnipsListSnippets = "<C-l>"
vim.g.UltiSnipsJumpForwardTrigger = "<A-l>"
vim.g.UltiSnipsJumpBackwardTrigger = "<A-h>"

vim.g.delimitMate_expand_cr = 0
vim.g.delimitMate_balance_matchpairs = 1

vim.g.magit_default_fold_level = 1
vim.g.magit_commit_title_limit = 80
vim.g.magit_auto_foldopen = 0

vim.g['airline#extensions#tabline#enabled'] = 0
vim.g['airline#extensions#branch#enabled'] = 1
vim.g['airline#extensions#branch#empty_message'] = '(no branch)'
vim.g['airline#extensions#branch#vcs_priority'] = {"git", "mercurial"}
vim.g['airline#extensions#vimagit#enabled'] = 1
vim.g['airline#extensions#branch#sha1_len'] = 8
vim.g.airline_detect_modified = 1
vim.g.airline_detect_paste = 1
vim.g.airline_detect_spell = 0
vim.g.airline_theme = 'serene'
vim.g.airline_powerline_fonts = 0
vim.g.airline_symbols_ascii = 1
vim.g.airline_skip_empty_sections = 0
vim.g['airline#extensions#wordcount#enabled'] = 0
vim.g['airline#extensions#default#layout'] = { {"a", "b", "c"}, {"x", "z"} }

-- if !exists('g:airline_symbols')
--     let g:airline_symbols = {}
      -- maxlinenr = "☰",
vim.g.airline_symbols = {
      branch = "ᚠ",
      colnr = ":",
      crypt = "🔒",
      dirty = "!",
      ellipsis = "...",
      keymap = "Keymap:",
      linenr = " ㏑:",
      maxlinenr = " col",
      modified = "+",
      notexists = "Ɇ",
      paste = "PASTE",
      readonly = "⊝",
      space =  ,
      spell = "SPELL",
      whitespace = "☲"
}

vim.g.airline_right_sep = ""
vim.g.airline_left_sep = ""
-- let g:airline_left_sep = '»'
-- vim.g.airline_left_sep = '▶'
-- let g:airline_right_sep = '«'
-- vim.g.airline_right_sep = '◀'

-- https://github.com/junegunn/fzf/blob/master/README-VIM.md
vim.g.fzf_action = { ['ctrl-t'] = '', ['ctrl-b'] = 'split', ['ctrl-v'] = 'vsplit'}
vim.g.fzf_layout = { window = { width = 0.99, height = 0.94 }}
