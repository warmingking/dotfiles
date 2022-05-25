vim.cmd('let mapleader = " "')
vim.cmd('let maplocalleader = " "')

-- number toggle
vim.wo.number = true
vim.wo.relativenumber = true

-- tab space
vim.go.tabstop = 4
vim.go.shiftwidth = 4
vim.go.expandtab = true
vim.go.smartindent = true

require("core")
require("configs")
