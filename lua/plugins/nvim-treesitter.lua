return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    ensure_installed = {
      "lua", "vim", "javascript", "typescript", "tsx", "json",
      "html", "css", "bash", "python", "go", "rust", "c", "cpp"
    },

    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
  }
}
