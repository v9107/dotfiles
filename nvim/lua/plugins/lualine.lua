local function custom_mode()
    local mode = vim.api.nvim_get_mode()
    return string.upper(mode.mode)
end

return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                --section_separators = { right = "", left = "" },
                section_separators = { right = "", left = "" },
                component_separators = "",
            },
            sections = {
                lualine_a = { custom_mode },
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
