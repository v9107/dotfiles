return {
	-- colorscheme
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
		},
	},
	{ "dasupradyumna/midnight.nvim", lazy = false, priority = 1000 },
	-- usefull git stuff
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
}
