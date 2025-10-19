return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "hrsh7th/nvim-cmp", event = "InsertEnter" },
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"stevearc/conform.nvim",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	lazy = true,
	config = function()
		require("customs.lspconfig").setup()
	end,
}
