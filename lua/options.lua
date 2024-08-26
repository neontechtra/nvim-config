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

-- set shift width to 4 also
vim.opt.shiftwidth = 4

-- sync clipboards (pressing P :) )
vim.opt.clipboard = "unnamedplus"
-- keep cursor in the middle when scrolling
vim.opt.scrolloff = 999

-- virtual edit to block mode
-- allows us to use visual block and select non filled cells
-- eg. list of preambles.. -> ctrl v (block) , c (change), {new value}
vim.opt.virtualedit = "block"

-- split when previewing changes
vim.opt.inccommand = "split"

-- ignore case sensitivity for command search 
vim.opt.ignorecase = true

-- termguicolors
vim.opt.termguicolors = true
