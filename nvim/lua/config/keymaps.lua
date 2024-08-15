local keymap = vim.keymap
local opts = { noremap = true, silent = true }
-- local builtin = require('telescope.builtin')

keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { silent = true })
keymap.set("n", "<leader>m", "<cmd>Mason<cr>", { silent = true })
keymap.set("n", "<leader>fd", vim.cmd.Explore, { silent = true })

-- telescope keymaps
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {})
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", {})
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {})
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {})
keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", {})

-- split screen
keymap.set("n", "<leader>wv", "<cmd>vs<cr>", opts)
keymap.set("n", "<leader>wh", "<cmd>split<cr>", opts)

keymap.set("n", "<leader>wtv", "<cmd>vs<cr><cmd>wincmd l<cr><cmd>term<cr>", opts)
keymap.set("n", "<leader>wth", "<cmd>split<cr><cmd>wincmd j<cr><cmd>term<cr>", opts)
