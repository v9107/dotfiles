--- @alias PluginConfig table<string, any>
M = {}

--- @class ServerConfig
--- @field settings table<string, any> The settings of the server
--- @field capabilities? table<string, any> Optional capabilities if not then default ones will be used
---
--- @type { [string]: ServerConfig}
M.configurations = {
	["pylsp"] = {
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
	},

	["lua_ls"] = {},

	["gopls"] = {},

	["ocamllsp"] = {},

	["rust_analyzer"] = {},
}

return M
