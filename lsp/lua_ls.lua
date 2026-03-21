return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".git", "lua-language-server" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.env.VIMRUNTIME },
    },
  },
}
