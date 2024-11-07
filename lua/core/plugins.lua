require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
    -- {
    --     "benlubas/molten-nvim",
    --     version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    --     dependencies = { "3rd/image.nvim" },
    --     build = ":UpdateRemotePlugins",
    --     init = function()
    --         -- these are examples, not defaults. Please see the readme
    --         vim.g.molten_image_provider = "image.nvim"
    --         vim.g.molten_output_win_max_height = 20
    --     end,
    -- },
    -- {
    --     -- see the image.nvim readme for more information about configuring this plugin
    --     "3rd/image.nvim",
    --     opts = {
    --         backend = "kitty", -- whatever backend you would like to use
    --         max_width = 100,
    --         max_height = 12,
    --         max_height_window_percentage = math.huge,
    --         max_width_window_percentage = math.huge,
    --         window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
    --         window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    --     },
    -- }
})
