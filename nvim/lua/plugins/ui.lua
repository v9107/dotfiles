return {
	-- colorscheme
	{
		"craftzdog/solarized-osaka.nvim",
		opts = {
			transparent = false,
		},
	},
	{
		"neanias/everforest-nvim",
		config = function(_, opts)
			opts = vim.tbl_deep_extend("force", opts, {
				background = "hard",
				italics = true,
				disable_italic_comments = false,
			})
			require("everforest").setup(opts)
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_bg = true,
		},
	},
	{ "dasupradyumna/midnight.nvim" },
	{ "phha/zenburn.nvim" },

	-- usefull git stuff
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{ "nvim-tree/nvim-web-devicons" },
}
