-- bootstrap lazy.nvim (plugin manager) and load modular config
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("marconso.plugins")
require("marconso.settings")
require("marconso.keymaps")
require("marconso.cmp")
require("marconso.lsp")
require("marconso.git")
require("marconso.neo-tree")
require("marconso.treesitter")
require("marconso.lualine")
require("marconso.indent-blankline")
require("marconso.rainbow-delimiters")
