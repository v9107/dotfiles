return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				prompt_prefix = "    ",
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
				find_files = {
					previewer = false,
				},
			},
		})
		telescope.load_extension("fzf")
	end,
}
