vim.cmd.completeopt = { "menuone", "noinsert", "noselect" }

require("mason").setup()
require("mason-lspconfig").setup({ ensure_installed = { "lua_ls" }, automatic_installation = true })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		ocaml = { "ocamlformat" },
		rust = { "rustfmt" },
		nix = { "nixfmt" },
	},
	format_after_save = nil,
})

require("luasnip.loaders.from_vscode").lazy_load()

--- auto completion setup
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

cmp.setup({
	--completion = {
	--	autocomplete = true,
	--},
	formatting = {
		-- ordering row items
		fields = { "abbr", "kind", "menu" },
		format = lspkind.cmp_format({
			-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
			mode = "symbol_text",
			maxwidth = 50,
			ellipsis_char = "...",
			show_labelDetails = true,
			before = function(entry, vim_item)
				-- Customize the menu field to show the source name in a formatted way
				vim_item.menu = ({
					buffer = "[Buffer]", -- Display "[Buffer]" for buffer source
					nvim_lsp = "[LSP]", -- Display "[LSP]" for LSP source
					luasnip = "[Snippet]", -- Display "[Snippet]" for snippet source
					nvim_lua = "[Lua]", -- Display "[Lua]" for Neovim Lua API source
					latex_symbols = "[LaTeX]", -- Display "[LaTeX]" for LaTeX symbols source
					path = "[Path]", -- Display "[Path]" for file path completion
					spell = "[Spell]", -- Display "[Spell]" for spelling correction
				})[entry.source.name]

				return vim_item
			end,
		}),
		expandable_indicator = true,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	}),
})
-- lsp setup
local protocol = require("vim.lsp.protocol")
local capabilities = require("cmp_nvim_lsp").default_capabilities(protocol.make_client_capabilities())

--- Python LSP setup
vim.lsp.config("pylsp", {
	capabilities = capabilities,
	settings = {
		pylsp = {
			configurationSources = {},
			plugins = {
				jedi_completion = {
					enabled = true,
					include_params = true,
					fuzzy = true,
				},
				flake8 = {
					enabled = true,
					perFileIgnores = { "__init__.py:F401" },
				},
				pycodestyle = { enabled = false },
				pydocstyle = { enabled = false },
				autopep8 = { enabled = false },
				pylint = { enabled = false },
				pylsp_mypy = { enabled = false },
				rope_autoimport = { enabled = false },
			},
			trace = { server = "verbose" },
		},
	},
})

--- lua setup
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
})

--- go setup
vim.lsp.config("gopls", {
	capabilities = capabilities,
})

--- ocaml lsp setup
vim.lsp.config("ocamllsp", {
	capabilities = capabilities,
})

--- rust lsp setup
vim.lsp.config("rust_analyzer", {
	capabilities = capabilities,
})
