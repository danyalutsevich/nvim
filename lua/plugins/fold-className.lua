return {
  "razak17/tailwind-fold.nvim",
  opts = {},
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade" },
  config = function()
    require("tailwind-fold").setup({
      -- your configuration
    })
  end,
}
