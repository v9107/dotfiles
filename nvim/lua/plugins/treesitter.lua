local languages = { "c", "bash", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", }
local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  opts = {
    ensure_installed = languages,
    highlight = {
      enable = true,
      use_languagetree = true
    },
    indent = {
      enable = true
    },
    autotag = {
      enable = true
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false
    },
    refactor = {
      highlight_definitions = {
        enable = true
      },
      highlight_current_scope = {
        enable = false
      }
    }
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

return M
