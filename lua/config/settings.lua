vim.g.mapleader = " "
vim.cmd("colorscheme habamax")
vim.o.number = true
vim.o.rnu = true
vim.o.autocomplete = true
vim.o.confirm = true
vim.o.signcolumn = "yes:1"
vim.o.completeopt = "fuzzy,menu,menuone,popup"
-- vim.o.complete = ""
vim.o.winborder = "rounded"
vim.o.termguicolors = true
vim.o.scrolloff = 10



-- vim.lsp.enable("vim")
vim.lsp.enable("pyright")
