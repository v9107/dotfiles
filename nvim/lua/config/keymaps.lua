local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { silent = true })
keymap.set("n", "<leader>m", "<cmd>Mason<cr>", { silent = true })
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { silent = true })
-- reload current buffer
keymap.set("n", "<leader>r", "<cmd>e!<cr>", { silent = true })

-- change background to light
keymap.set("n", "<leader>cb", "<cmd>set background=light<cr>", { silent = true })

-- telescope keymaps
keymap.set("n", "<leader><space>", "<cmd>Telescope find_files<cr>", opts)
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", opts)
keymap.set("n", "<leader>vh", "<cmd>Telescope help_tags<cr>", opts)

-- split screen
keymap.set("n", "<leader>vs", "<cmd>vs<cr><cmd>wincmd l<cr>", opts)
keymap.set("n", "<leader>hs", "<cmd>split<cr><cmd>wincmd j<cr>", opts)
