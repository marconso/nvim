local plugins = {
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
  },
  -- LSP + installer
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },

  -- Autocomplete
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },

  -- File explorer
  { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" } },

  -- Fuzzy finder (optional but handy)
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Git / GitHub
  { "lewis6991/gitsigns.nvim" },
  { "tpope/vim-fugitive" },
  -- Octo (GitHub integration: PRs, issues). Requires `gh` (GitHub CLI) configured.
  { "pwntester/octo.nvim", dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" } },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },

  {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      ---@module "ibl"
      ---@type ibl.config
      opts = {},
  },
  { "HiPhish/rainbow-delimiters.nvim" },

  { "olimorris/onedarkpro.nvim", },
  {
        "catppuccin/nvim",
        name = "catppuccin", priority = 1000 
  },
  { "iamcco/markdown-preview.nvim" },
  {
   "nvim-lualine/lualine.nvim",
   dependencies = { "nvim-tree/nvim-web-devicons" }
  },
  { "saghen/blink.cmp", },
  {
     "folke/todo-comments.nvim",
     dependencies = { "nvim-lua/plenary.nvim" },
     opts = {}
  },
  {
     'vyfor/cord.nvim',
      build = ':Cord update',
      -- opts = {}
  },
}


require("lazy").setup(plugins, {
  defaults = { lazy = true },
  -- checker = { enabled = true }, -- auto-update check
})
