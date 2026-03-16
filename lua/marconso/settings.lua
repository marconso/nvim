local opt = vim.opt

-- Basics
vim.g.mapleader = " "
opt.completeopt = "menu,noinsert,menuone,noselect,preview"
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.winborder = 'rounded'   
-- opt.clipboard = "unnamedplus"
opt.updatetime = 200
opt.termguicolors = true
opt.scrolloff = 10
vim.cmd[[colorscheme catppuccin]]

-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--
vim.g.neovide_opacity = 0.1
vim.g.neovide_normal_opacity = 0.1

opt.cursorline = true
-- opt.cursorcolumn = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true
opt.autoindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.updatetime = 300
opt.timeoutlen = 500
opt.writebackup = false
opt.swapfile = false

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
