local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local function floating_oil_window()
	local current_file_path = vim.api.nvim_buf_get_name(0)
	if current_file_path then
		local current_dir = string.match(current_file_path, "(.*/)")
		require("oil").toggle_float(current_dir)
	else
		require("oil").toggle_float(".")
	end
end

keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { silent = true })
keymap.set("n", "<leader>m", "<cmd>Mason<cr>", { silent = true })
keymap.set("n", "<leader>e", floating_oil_window, { silent = true })
keymap.set("n", "<leader>t", "<cmd>ToggleTerm<cr>", { silent = true })
keymap.set("n", "<leader>r", "<cmd>e!<cr>", { silent = true }) -- reload current buffer

keymap.set("n", "<leader>cb", "<cmd>set background=light<cr>", { silent = true }) -- change background to light

keymap.set("n", "<leader><space>", "<cmd>Telescope find_files<cr>", opts) -- telescope keymaps

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap.set("n", "<leader>fc", "<cmd>Telescope colorscheme<cr>", opts)
keymap.set("n", "<leader>vh", "<cmd>Telescope help_tags<cr>", opts)

keymap.set("n", "<leader>vs", "<cmd>vs<cr><cmd>wincmd l<cr>", opts) -- split screen
keymap.set("n", "<leader>hs", "<cmd>split<cr><cmd>wincmd j<cr>", opts)

keymap.set("n", "<leader>ng", "<cmd>Neogit<cr>", opts)
