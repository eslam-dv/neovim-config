return {
  "nobbmaestro/nvim-andromeda",
  dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" },
  config = function()
    require("andromeda").setup({
      preset = "andromeda",
      styles = {
        italic = true,
      }
    })
  end,
}
