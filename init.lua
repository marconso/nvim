vim.g.mapleader = " "
vim.o.tabstop = 4
vim.o.winborder = "rounded"
vim.o.rnu = true
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.scrolloff = 10
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.completeopt = "menu,noinsert,menuone,noselect,preview"
vim.o.autoindent = true
vim.o.cursorline = true


vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local _ = vim.api.nvim_buf_get_mark(0, "^")
        local last_pos = vim.fn.line("'\"")
        if last_pos > 0 and last_pos <= vim.fn.line("$") then
            pcall(vim.api.nvim_win_set_cursor, 0, { last_pos, 0 })
        end
    end,
})

vim.pack.add({
    { src = "https://github.com/folke/tokyonight.nvim" },
    { src = "https://github.com/marko-cerovac/material.nvim" },
    { src = "https://github.com/rebelot/kanagawa.nvim" },
    { src = "https://github.com/rose-pine/neovim" },
    { src = "https://github.com/navarasu/onedark.nvim" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/saghen/blink.cmp" },
    -- { src = "https://github.com/mrcjkb/rustaceanvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/windwp/nvim-autopairs" },
    { src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/nvim-neo-tree/neo-tree.nvim",        branch = "v3.x" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/folke/todo-comments.nvim" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})


vim.g.material_style = "darker"

require("neo-tree").setup({
    close_if_last_window = true,
    filesystem = {
        follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
            close_if_last_window = true
        },
        hijack_netrw_behavior = "open_default",
    },
    window = {
        position = "left",
        width = 30,
    },
})

require("todo-comments").setup()
require("ibl").setup()
require("nvim-autopairs").setup()
require("lualine").setup({ theme = 'default' })
require("telescope").setup()
require("mason").setup()
require("blink.cmp").setup({
    fuzzy = { implementation = "prefer_rust" },
    completion = {
        documentation = { auto_show = true },
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    keymap = {
        preset = "none",
        ["<C-d>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
    },
})
require("gitsigns").setup({
    signs = {
        add = { text = "+" },
        change = { text = "~" },
        topdelete = { text = "-" },
        delete = { text = "_" },
        changedelete = { text = "~" },
    }
})


local servers = { "lua_ls", "pyright", "rust_analyzer", "clangd", "vim", "bashls", "r_language_server" }

vim.lsp.enable(servers)

vim.keymap.set({ "n", "x", "v" }, "<leader>lf", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set({ "n", "x", "v" }, "<leader>y", '"+y<CR>')
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>")


vim.cmd 'colorscheme material'

local ts = require("nvim-treesitter")
local parsers = {
    "bash", "dockerfile", "elixir", "git_config",
    "gitcommit", "gitignore", "groovy", "go", "heex", "html", "http",
    "java", "javascript", "lua", "make", "markdown",
    "markdown_inline", "python", "regex", "rst", "rust", "ssh_config",
    "sql", "typst", "toml", "tsx", "typescript", "vim", "vimdoc",
    "yaml",
}

for _, parser in ipairs(parsers) do
    ts.install(parser)
end

local patterns = {}
for _, parser in ipairs(parsers) do
    local parser_patterns = vim.treesitter.language.get_filetypes(parser)
    for _, pp in pairs(parser_patterns) do
        table.insert(patterns, pp)
    end
end
vim.treesitter.language.register("groovy", "Jenkinsfile")
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.api.nvim_create_autocmd("FileType", {
    pattern = patterns,
    callback = function()
        vim.treesitter.start()
    end,
})

vim.keymap.set("v", "<leader>tt", ":!toilet -w 200 -f term -F border<CR>")
