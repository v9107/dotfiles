return {
	{
		"craftzdog/solarized-osaka.nvim",
		config = function()
			require("solarized-osaka").setup({
				transparent = false,
			})
		end,
	},
	{
		"oxfist/night-owl.nvim",
		lazy = false,
		priority = 1000,
	},
}
