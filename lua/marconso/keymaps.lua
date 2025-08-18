local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- open neo-tree
map("n", "<leader>e", ":Neotree toggle<CR>", opts)
-- telescope find files
map("n", "<leader>f", ":Telescope find_files<CR>", opts)
map("n", "<leader>g", ":Telescope live_grep<CR>", opts)
-- quick save
map("n", "<leader>w", ":w<CR>", opts)
-- LSP diagnostics
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<leader>ld", vim.diagnostic.open_float, opts)

-- cmp confirm mapping (set in cmp config too)
