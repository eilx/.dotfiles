-- Fix indentation
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false

-- Colors
vim.o.termguicolors = true

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Save undos
vim.o.undofile = true

-- Better searching
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- Better folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevel = 99
vim.o.foldenable = false

-- Better completion
vim.o.completeopt = 'menuone,noselect'

-- Sign column
vim.wo.signcolumn = 'yes'

-- Give me some space!
vim.o.scrolloff = 12

-- Unsorted
vim.o.updatetime = 200
vim.o.timeout = true
vim.o.timeoutlen = 300
