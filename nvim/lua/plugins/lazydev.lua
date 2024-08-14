return {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
		library = {
			"luvit-meta/library",
			-- It can also be a table with trigger words / mods
			-- Only load luvit types when the `vim.uv` word is found
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		},
		-- disable when a .luarc.json file is found
		enabled = function(root_dir)
			return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
		end,
	},
}
