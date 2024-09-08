return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "nord",
				section_separators = { right = "", left = "" },
				component_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "filename", file_status = false, path = 4 },
				},
				lualine_c = { "branch", "diff", "diagnostics" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
