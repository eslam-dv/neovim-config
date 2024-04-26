return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  config = function()
    require("silicon").setup({
      font = "JetBrainsMonoNL Nerd Font Mono=34;Noto Color Emoji=34",
      no_window_controls = true,
      to_clipboard = true,
      output = function()
        return "/home/eslam/Pictures/Screenshots/"
      end,
    })
  end
}
