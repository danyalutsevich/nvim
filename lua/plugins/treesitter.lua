return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",
        "css",
        "html",
        "json5",
        "bash",
        "scss",
        "markdown",
        "dockerfile",
        "python",
        "typescript",
        "go",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
