local set = vim.keymap.set
local builtin = require('telescope.builtin')

set('n', '<leader>l', "<cmd>Lazy<cr>", { silent = true })
set('n', '<leader>fd', vim.cmd.Explore, { silent = true })
set('n', '<leader>m', "<cmd>Mason<cr>", { silent = true })

set('n', '<leader>ff', "<cmd> Telescope find_files<cr>", {})
set('n', '<leader>fg', "<cmd> Telescope live_grep<cr>", {})
set('n', '<leader>fb', "<cmd> Telescope buffers<cr>", {})
set('n', '<leader>fh', "<cmd> Telescope help_tags<cr>", {})
set('n', '<leader>fc', "<cmd>Telescope colorscheme<cr>", {})
