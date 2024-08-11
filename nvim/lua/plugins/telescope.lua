return {
    	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		defaults = {
			prompt_prefix = "  ",
			sorting_strategy = "ascending",
			layout_config = {
				prompt_position = "top",
			},
		},
		pickers = {
			colorscheme = {
				enable_preview = true,
			},
		},
	},
}
