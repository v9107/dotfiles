return {
	-- colorscheme
	{
		"craftzdog/solarized-osaka.nvim",
		opts = {
			transparent = true,
		},
	},
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false,
		priority = 1000,
	},
	-- usefull git stuff
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{ "nvim-tree/nvim-web-devicons" },
}
