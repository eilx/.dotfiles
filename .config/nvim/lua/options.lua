-- Nicer indentation
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false

-- Nicer UI
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 200

-- Nicer scrolling
vim.o.scrolloff = 12

-- Nicer completion
vim.o.completeopt = 'menuone,noselect'

-- Nicer searching
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- Nicer... timeout?
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Save undos
vim.o.undofile = true
