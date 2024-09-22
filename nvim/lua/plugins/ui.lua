return {
	-- colorscheme
	{
		"craftzdog/solarized-osaka.nvim",
		opts = {
			transparent = true,
		},
	},
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent_bg = false,
		},
	},
	{
		"shaunsingh/nord.nvim",
	},
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
