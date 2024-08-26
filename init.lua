print("hello")
-- set numbers and make them relative to cursor
vim.opt.number = true
vim.opt.relativenumber = true

-- split below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- turn off linewrap
vim.opt.wrap = false

-- tab four spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4

-- sync clipboards
vim.opt.clipboard = "unnamedplus"
-- keep cursor in the middle when scrolling
vim.opt.scrolloff = 999


