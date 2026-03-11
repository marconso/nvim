return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
      ensure_installed = { "bash", "c", "cpp", "python", "javascript", "typescript", "rust", "lua", "vim", "html", "yaml" },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true },
      textobjects = { enable = true },
  }
}
