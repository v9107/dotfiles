return {
	-- colorscheme
	{
		"zenbones-theme/zenbones.nvim",
		dependencies = "rktjmp/lush.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		-- Using Packer
		"navarasu/onedark.nvim",
		opts = {
			style = "warmer",
		},
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
