return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local andromeda_lualine = require("andromeda.plugins.lualine")

    lualine.setup({
      options = {
          theme = andromeda_lualine.theme,
      },
      sections = andromeda_lualine.sections,
      inactive_sections = andromeda_lualine.inactive_sections,
    })
  end,
}
