local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- local builtin = require('telescope.builtin')

keymap.set('n', '<leader>l', "<cmd>Lazy<cr>", { silent = true })
keymap.set('n', '<leader>m', "<cmd>Mason<cr>", { silent = true })
keymap.set('n', '<leader>fd', vim.cmd.Explore, { silent = true })

-- telescope keymaps
keymap.set('n', '<leader>ff', "<cmd> Telescope find_files<cr>", {})
keymap.set('n', '<leader>fg', "<cmd> Telescope live_grep<cr>", {})
keymap.set('n', '<leader>fb', "<cmd> Telescope buffers<cr>", {})
keymap.set('n', '<leader>fh', "<cmd> Telescope help_tags<cr>", {})
keymap.set('n', '<leader>fc', "<cmd>Telescope colorscheme<cr>", {})

-- split screen
keymap.set('n', '<leader>vs', "<cmd>vs<cr>", opts)
keymap.set('n', '<leader>hs', "<cmd>split<cr>", opts)
