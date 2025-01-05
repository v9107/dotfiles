--vim.opt.guicursor = ""                     -- disable the cursor change when in insert mode

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.number = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "auto"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
-- diable the text under default status line
vim.opt.showmode = true
