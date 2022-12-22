-- remap = true: binding is recursive (non-default)
vim.keymap.set('n', '<leader>d', function() vim.fn['ToggleReadOnly']() end,
               {remap = false, silent = true, desc = 'Toggle RO'})
vim.keymap.set('n', 'gs', ':setlocal spell!<CR>',
               {remap = false, silent = true, desc = 'Toggle spellcheck'})
vim.keymap.set('n', 'gw', ':ToggleWhitespace<CR>',
               {remap = false, silent = true, desc = 'Toggle whitespace'})
vim.keymap.set('n', '<space>', 'za', {remap = false, desc = ''})
vim.keymap.set('n', '<leader>vt', ':vsplit +terminal <bar> doautocmd WinEnter<CR>', {remap = false, silent = true})
vim.keymap.set('n', '<leader>bt', ':split +terminal <bar> doautocmd WinEnter<CR>', {remap = false, silent = true})
vim.keymap.set('n', '<leader>t',
               ':exe v:count1 . \'ToggleTerm direction=float\' <bar> doautocmd WinEnter <CR>',
               {remap = false, silent = true})
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', {remap = false, silent = true})

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<c-s>', function() vim.cmd('wall') end)
vim.keymap.set('n', ']]', ']]zt3<C-Y>')
vim.keymap.set('n', '[[', ']]zt3<C-Y>')
vim.keymap.set({'n'}, '<leader>q', ':q<CR>')
-- vim.keymap.set({'t'}, '<leader>q', '<c-\\><c-n>:q<CR>')

vim.keymap.set('', '<A-m>', '<C-E>')
vim.keymap.set('', '<A-,>', '<C-Y>')
vim.keymap.set('', '<A-u>', '<C-d>')
vim.keymap.set('', '<A-i>', '<C-u>')
vim.keymap.set('n', '<A-]>', function() vim.cmd('bnext') end, {silent = true})
vim.keymap.set('n', '<A-[>', function() vim.cmd('bprevious') end, {silent = true})
vim.keymap.set('n', '`h', '<C-w>h')
vim.keymap.set('n', '`l', '<C-w>l')
vim.keymap.set('n', '`j', '<C-w>j')
vim.keymap.set('n', '`k', '<C-w>k')

vim.keymap.set('n', ',/', ':nohlsearch<CR>', {silent = true})
vim.keymap.set('n', '*', ':let @/=expand("<cword>")<CR> :set hlsearch<CR>', {silent = true})
vim.keymap.set('c', 'w!!', 'w !sudo tee % >/dev/null')
vim.keymap.set('c', 'vh', function()
                            return (vim.fn.getcmdtype()==':' and vim.fn.getcmdpos()==1 and 'vertical help' or 'vh')
                          end, {expr = true})
vim.keymap.set('n', '<leader>vs', '<C-w>v<C-w>l')
vim.keymap.set('n', '<leader>bs', '<C-w>s<C-w>j')
-- vim.keymap.set('n', '', ':vsplit ~/.config/nvim/init.vim<CR>', {silent = true})
vim.keymap.set('n', '<leader>e', ':Vifm <bar> doautocmd WinEnter<CR>', {remap = false, silent = true})
vim.keymap.set('n', '<leader>df', ':DiffVifm <bar> doautocmd WinEnter<CR>', {remap = false, silent = true})
vim.keymap.set('n', '<leader>ve', ':vsplit +Vifm <bar> doautocmd WinEnter<CR>', {remap = false, silent = true})
vim.keymap.set('n', '<leader>be', ':split +Vifm <bar> doautocmd WinEnter<CR>', {remap = false, silent = true})

vim.keymap.set('n', '<leader>n', ':MagitOnly<CR>', {silent = true})
vim.keymap.set('n', '<leader>m', ':Magit<CR>', {silent = true})

vim.keymap.set({'n', 'x', 'o'}, '<leader>c', '<Plug>Commentary')
vim.keymap.set({'n'}, '<leader>cc', '<Plug>CommentaryLine')
vim.keymap.set({'n'}, '<leader>cu', '<Plug>Commentary<Plug>Commentary')
if vim.fn.maparg('c', 'n') == '' then
    vim.keymap.set({'n'}, 'c<leader>c', '<Plug>ChangeCommentary')
end

-- :Vifm | doautocmd WinEnter
-- :vert Vifm | doautocmd WinEnter
