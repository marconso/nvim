-- lua/plugins/telescope.lua
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x", -- ajuste se quiser
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build -- -j" },
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-project.nvim",
  },
  opts = {
    defaults = {
      prompt_prefix = "🔭 ",
      selection_caret = "➜ ",
      path_display = { "shorten" },
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = { preview_width = 0.55 },
        vertical = { mirror = false },
      },

      mappings = {
        i = {},
        n = {},
      },

      file_ignore_patterns = { "node_modules", ".git/", "dist", "venv" },
      vimgrep_arguments = {
        "rg", "--hidden", "--glob", "!.git/", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"
      },
    },

    pickers = {
      find_files = {
        theme = "dropdown",
        previewer = true,
        hidden = true,
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
        sort_lastused = true,
      },
      live_grep = {
      },
    },

    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      file_browser = {
        theme = "ivy",
        hijack_netrw = true,
      },
    },
  },
  config = function(_, opts)
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  keys = {
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope: Find files" }),
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Telescope: Live grep" }),
    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope: Buffers" }),
    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope: Help" }),
    vim.keymap.set("n", "<leader>fp", "<cmd>Telescope project<cr>", { desc = "Telescope: Projects (extension)" }),
    vim.keymap.set("n", "<leader>fbf", "<cmd>Telescope file_browser<cr>", { desc = "Telescope: File Browser (extension)" }),
  },
    telescope.setup(opts)

    pcall(function() telescope.load_extension("fzf") end)
    pcall(function() telescope.load_extension("file_browser") end)
    pcall(function() telescope.load_extension("project") end)
    end,
}
