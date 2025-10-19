local M = {}

--- @param ensure_installed table<string>
--- @return nil
M.init_mason = function(ensure_installed)
	require("mason").setup()
	require("mason-lspconfig").setup({ ensure_installed = ensure_installed, automatic_installation = true })
end

M.init_formatter = function()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			ocaml = { "ocamlformat" },
			rust = { "rustfmt" },
			nix = { "nixfmt" },
		},
		format_after_save = true,
	})
end

M.auto_completion = function()
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
end

--- @class ServerConfig
--- @field settings table<string, any> The settings of the server
--- @field capabilities? table<string, any> Optional capabilities if not then default ones will be used
---
--- @param server_configs { [string]: ServerConfig }
M.lsp_setup = function(server_configs)
	local protocol = require("vim.lsp.protocol")
	local capabilities = require("cmp_nvim_lsp").default_capabilities(protocol.make_client_capabilities())

	for server, config in pairs(server_configs) do
		if not config.capabilities then
			config.capabilities = capabilities
		end
		vim.lsp.config(server, config)
	end
end

--- setting up and configuring the lsp
M.setup = function()
    
	require("luasnip.loaders.from_vscode").lazy_load()
	local server_configs = require("customs.lspconfig.servers")

	vim.cmd.completeopt = { "menuone", "noinsert", "noselect" }

	M.init_mason({ "lua_ls" })
	M.init_formatter()
	M.auto_completion()

	if server_configs then
		M.lsp_setup(server_configs.configurations)
	end
end

return M
