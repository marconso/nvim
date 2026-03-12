require('nvim-treesitter').setup {
  opts = {
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },
  indent = {
      enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  }
}
