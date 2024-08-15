return {
	-- colorscheme
	{
		"craftzdog/solarized-osaka.nvim",
		opts = {
			transparent = false,
		},
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
}
