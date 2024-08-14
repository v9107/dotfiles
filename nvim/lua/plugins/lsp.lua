return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		-- "WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"stevearc/conform.nvim",
	},
	event = { "BufReadPre", "BufNewFile" },
	lazy = true,
	config = function()
		-- local protocol = require("vim.lsp.protocol")
		require("mason").setup()
		require("mason-lspconfig").setup({ automatic_installation = { exclude = { "pylsp" } } })
		-- auto formating
		require("conform").setup({
			formatters_by_ft = { lua = { "stylua" }, python = { "isort", "black" } },
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})

		local nvim_lsp = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		nvim_lsp["pylsp"].setup({
			capabilities = capabilities,
		})

		nvim_lsp["lua_ls"].setup({
			capabilities = capabilities,
		})
	end,
}
