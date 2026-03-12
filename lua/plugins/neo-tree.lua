return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    ---@module 'neo-tree'
    ---@type neotree.Config
    opts = {
        close_if_last_window = true,
	popup_border_style = "rounded",
	window = {
	    position = "left",
	    width = 25
	}
    },
    keys = {
        vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle reveal<cr>", { desc = "Explorer (Neo-tree)" })
    }
  },
}
