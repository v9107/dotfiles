return {
	{
		"craftzdog/solarized-osaka.nvim",
		opts = {
			transparent = false,
		},
	},
	{
		"oxfist/night-owl.nvim",
	},
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.nord_contrast = true
			vim.g.nord_borders = true
			vim.g.nord_disable_background = false
			vim.g.nord_italic = true
			vim.g.nord_uniform_diff_background = false
			vim.g.nord_bold = false
		end,
	},
}
