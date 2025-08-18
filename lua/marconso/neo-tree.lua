pcall(function()
  require('neo-tree').setup({
    close_if_last_window = true,
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = "open_default",
    },
    window = {
      position = "left",
      width = 35,
    },
  })
end)
