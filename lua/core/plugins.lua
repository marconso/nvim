require("lazy").setup({
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000 
  },
    {
    "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
  "dracula/vim",
  "tpope/vim-commentary",
  "mattn/emmet-vim",
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",
  "ellisonleao/gruvbox.nvim",
  "nvim-lualine/lualine.nvim",
  "nvim-treesitter/nvim-treesitter",
  "vim-test/vim-test",
  "lewis6991/gitsigns.nvim",
  -- "preservim/vimux",
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "stevearc/oil.nvim",
  -- completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  -- "github/copilot.vim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
    "lukas-reineke/indent-blankline.nvim",
     main = "ibl",
     opts = {}
  },
  {
    "vinnymeller/swagger-preview.nvim",
    run = "npm install -g swagger-ui-watcher",
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
 {
        "laytan/cloak.nvim",
        -- event = 'VeryLazy',
        -- event = 'VeryLazy',
        config = function()
             local opts = require "cloak"
            require("cloak").setup(opts)
        end,
    },
    {
        "andweeb/presence.nvim"
    },
})
