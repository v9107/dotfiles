local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local function floating_oil_window()
	local oil = require("oil")
	local current_file_path = vim.api.nvim_buf_get_name(0)
	if current_file_path then
		local current_dir = string.match(current_file_path, "(.*/)")
		oil.open_float(current_dir)
	else
		oil.open_float(".", { border = 2 })
	end
end

keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", opts)
keymap.set("n", "<leader>m", "<cmd>Mason<cr>", opts)
keymap.set("n", "<leader>e", floating_oil_window, opts)
keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", opts)
keymap.set("n", "<tab>", "<cmd>tabn<cr>", opts)
keymap.set("n", "<s-tab>", "<cmd>tabp<cr>", opts)

keymap.set("n", "<leader>cb", "<cmd>set background=light<cr>", opts) -- change background to light

keymap.set("n", "<leader><space>", "<cmd>Telescope find_files<cr>", opts) -- telescope keymaps

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", opts)
keymap.set("n", "<leader>vh", "<cmd>Telescope help_tags<cr>", opts)

keymap.set("n", "<leader>vs", "<cmd>vs<cr><cmd>wincmd l<cr>", opts) -- split screen
keymap.set("n", "<leader>hs", "<cmd>split<cr><cmd>wincmd j<cr>", opts)

keymap.set("n", "<leader>ng", "<cmd>Neogit<cr>", opts)
