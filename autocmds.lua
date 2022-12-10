vim.api.nvim_create_autocmd({"BufEnter"}, { pattern = {'*'}, callback = function()
        if vim.fn.getreg('%') == "" then
            vim.opt.filetype = 'c'
        end
        end
    })

vim.api.nvim_create_autocmd({"BufEnter", "BufNewFile", "BufRead"}, { pattern = {'*.s', '*.S'}, callback = function() vim.bo.filetype = 'ia64' end})
vim.api.nvim_create_autocmd({"BufEnter", "BufNewFile", "BufRead"}, { pattern = {'*.ld'}, callback = function() vim.bo.filetype = 'ld' end})

vim.api.nvim_create_autocmd({"BufEnter", "BufNewFile", "BufRead"},
                            { pattern = {'*.h', '*.hpp', '*.c', '*.cpp', '*.inc', '*.inl'}, callback = function()
                                vim.bo.filetype = 'cpp'
                            end
                            })

vim.api.nvim_create_autocmd({"TermOpen"}, { pattern = {'*'}, callback = function()
                                vim.opt.number = false
                                vim.opt_local.buflisted = false
                                vim.opt_local.bufhidden = 'unload'
                                vim.cmd.startinsert()
                                -- vim.keymap.del('n', '<leader>q')
                                vim.keymap.set('n', '<leader>q', ':norm i<CR> <leader>q')
                            end
                            })


vim.api.nvim_create_autocmd({"TermEnter"}, { pattern = {'term://*toggleterm#*'}, callback = function()
                                vim.keymap.set('t', '<leader>t', '<c-\\><c-n>:exe v:count1 . "ToggleTerm"<CR>', {silent = true})
                            end
                            })

vim.api.nvim_create_autocmd({"TermClose"}, { pattern = {'*'}, callback = function()
                                vim.opt.number = true
                                vim.keymap.set('n', '<leader>q', ':q<CR>', {silent = true})
                            end
                            })

vim.api.nvim_create_autocmd({"FileType"}, { pattern = {"c", "cpp"}, callback = function()
        vim.opt.completeopt = {'noinsert', 'menuone', 'noselect'}
        vim.opt.commentstring = "// %s"
        vim.opt_local.cindent = true
        vim.opt_local.cinoptions = "n1sLs:0l1g0.5sh0.5st0(0u0U0"
        vim.opt_local.colorcolumn = "121"
        vim.opt_local.foldmethod = "syntax"
        vim.opt_local.tabstop = 4
        vim.opt_local.textwidth = 120
        vim.fn['SearchCscopeDBAndSetupRoot']("cscope.out")
        end
    })

vim.api.nvim_create_autocmd({"FileType"}, { pattern = {"markdown", "txt", "gitcommit"}, callback = function()
        vim.opt.mouse = "nv"
        vim.opt.autoindent = true
        vim.opt.cindent = false
        vim.opt.smartindent = true
        vim.opt.cinwords = ''
        vim.opt.formatoptions:remove('2')
        vim.opt.formatoptions:append('t1nq')
        vim.opt.formatlistpat="^\\\\s*\\\\(\\\\d\\\\+[\\\\]:.)}\\\\t\\ ]\\\\|[-\\\\*]\\\\)\\\\s*"

        vim.keymap.set('i', '<leader>r', function()
                return vim.fn.pumvisible == 1 and "" or "<C-x><C-u>"
            end, {expr = true})
        vim.keymap.set('i', '<C-space>', function()
                return vim.fn.pumvisible == 1 and "" or "<C-x><C-k>"
            end, {expr = true})
        end
    })

vim.api.nvim_create_autocmd({"FileType"}, { pattern = {"gitcommit"}, callback = function()
        vim.opt.textwidth = 72
        vim.opt_local.colorcolumn = "73"
        end
    })

vim.api.nvim_create_autocmd({"FileType"}, { pattern = {"python"}, callback = function()
        vim.opt_local.foldmethod = "syntax"
        vim.fn['SearchPythonRoot'](".root.proj")
        end
    })

vim.api.nvim_create_autocmd({"FileType"}, { pattern = {"tex", "plaintex"}, callback = function()
        vim.opt_local.foldmethod = "syntax"
        vim.opt_local.textwidth = 0
        vim.opt_local.formatoptions=jclro

        vim.keymap.set('i', '<leader>r', function()
                return vim.fn.pumvisible == 1 and "" or "<C-x><C-u>"
            end, {expr = true})
        vim.keymap.set('i', '<C-space>', function()
                return vim.fn.pumvisible == 1 and "" or "<C-x><C-k>"
            end, {expr = true})
        end
    })

vim.api.nvim_create_autocmd({"FileType"}, { pattern = {"ia64"}, callback = function()
        vim.opt_local.cindent = true
        vim.opt_local.tabstop = 16
        end
    })

