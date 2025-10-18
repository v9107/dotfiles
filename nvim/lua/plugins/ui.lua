return {
    -- usefull git stuff
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    { "nvim-tree/nvim-web-devicons" },
}
