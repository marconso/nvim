local opt = vim.opt

-- Basics
vim.g.mapleader = " "
opt.completeopt = "menu,menuone,noselect,preview"
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
-- opt.clipboard = "unnamedplus"
opt.updatetime = 250
opt.termguicolors = true
opt.scrolloff = 10
pcall(vim.cmd, "colorscheme catppuccin")

opt.cursorline = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.autoindent = true
opt.wrap = false

-- remember last position in file
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, "^") -- alternate method
    local last_pos = vim.fn.line("'\"")
    if last_pos > 0 and last_pos <= vim.fn.line("$") then
      pcall(vim.api.nvim_win_set_cursor, 0, { last_pos, 0 })
    end
  end,
})
