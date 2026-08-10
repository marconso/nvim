vim.g.mapleader = " "

local opt = vim.o
opt.tabstop = 4
opt.winborder = "rounded"
opt.rnu = true
opt.wrap = false
opt.signcolumn = "yes"
opt.termguicolors = true
opt.scrolloff = 10
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.completeopt = "menu,noinsert,menuone,noselect,preview"
opt.autoindent = true
opt.cursorline = true
opt.inccommand = "split"
-- opt.colorcolumn = "80"

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
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/marko-cerovac/material.nvim" },
	{ src = "https://github.com/rebelot/kanagawa.nvim" },
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/navarasu/onedark.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/jmbuhr/otter.nvim" },
	{ src = "https://github.com/quarto-dev/quarto-nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", branch = "v3.x" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvimtools/none-ls.nvim" },
})

vim.g.material_style = "darker"

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "🤢",
			[vim.diagnostic.severity.WARN] = "😫",
			[vim.diagnostic.severity.INFO] = "😐",
			[vim.diagnostic.severity.HINT] = "😉",
		},
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "lua", "rust", "go", "cpp", "c" },
	callback = function()
		-- vim.bo.textwidth = 79
		-- vim.wo.colorcolumn = "80"
	end,
})

require("neo-tree").setup({
	close_if_last_window = true,
	filesystem = {
		follow_current_file = {
			enabled = true,
			leave_dirs_open = false,
			close_if_last_window = true,
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
require("mini.pairs").setup()
-- require("nvim-autopairs").setup()
require("lualine").setup({ theme = "default" })
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
		["<C-space>"] = { "show", "fallback" },
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
	},
})

vim.keymap.set("n", "<leader>gb", function()
	require("gitsigns").toggle_current_line_blame()
end, { desc = "Git Blame na linha" })
vim.keymap.set("n", "<leader>gc", ":Telescope git_bcommits<CR>", { desc = "Git Commits do arquivo" })
vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, { desc = "Ver parâmetros da função" })

vim.lsp.config["lua_ls"] = {
	settings = {
		Lua = {
			diagnostics = {
				-- Informa o servidor que a variável 'vim' é global do Neovim
				globals = { "vim" },
			},
			workspace = {
				-- Faz o linter reconhecer todas as APIs do Neovim
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
}

local servers = {
	"lua_ls",
	"pyright",
	"ruff",
	"stylua",
	"gopls",
	"rust_analyzer",
	"clangd",
	"bashls",
	"r_language_server",
	"yamlls",
}

vim.lsp.enable(servers)

vim.lsp.config["ruff"] = {
	init_options = {
		settings = {
			lineLength = 79,
		},
	},
}
vim.keymap.set({ "n", "x", "v" }, "<leader>lf", function()
	-- Se estiver em um arquivo Python, organiza os imports via Ruff antes de formatar
	if vim.bo.filetype == "python" then
		vim.lsp.buf.code_action({
			context = { only = { "source.organizeImports.ruff" } },
			apply = true,
		})
	end

	-- Executa a formatação normal via LSP (Ruff no Python, rust_analyzer no Rust, etc.)
	vim.lsp.buf.format({
		async = true,
		formatting_options = {
			tabSize = 4,
			insertSpaces = true,
		},
	})
end, { desc = "Format code and organize imports" })

vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set({ "n", "x", "v" }, "<leader>y", '"+y<CR>')
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>lD", ":Telescope diagnostics<CR>", { desc = "Listar todos os diagnósticos do projeto" })
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<CR>")

require("catppuccin").setup({
	flavour = "auto", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false, -- disables setting the background color.
	float = {
		transparent = false, -- enable transparent floating windows
		solid = false, -- use solid styling for floating windows, see |winborder|
	},
	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = false, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
		-- miscs = {}, -- Uncomment to turn off hard-coded styles
	},
	lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
		virtual_text = {
			errors = { "italic" },
			hints = { "italic" },
			warnings = { "italic" },
			information = { "italic" },
			ok = { "italic" },
		},
		underlines = {
			errors = { "underline" },
			hints = { "underline" },
			warnings = { "underline" },
			information = { "underline" },
			ok = { "underline" },
		},
		inlay_hints = {
			background = true,
		},
	},
	color_overrides = {},
	custom_highlights = {},
	default_integrations = true,
	auto_integrations = false,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		notify = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
	},
})

vim.cmd("colorscheme material-deep-ocean")

-- vim.api.nvim_set_hl(0, "Normal", {
-- 	ctermbg = "NONE",
-- 	bg = "NONE",
-- })

-- vim.api.nvim_set_hl(0, "NormalNC", {
-- 	ctermbg = "NONE",
-- 	bg = "NONE",
-- })

-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

require("nvim-treesitter").setup({
	indent = { enable = true },
	highlight = { enable = true },
})

require("quarto").setup()

local ts = require("nvim-treesitter")
local parsers = {
	"bash",
	"dockerfile",
	"elixir",
	"git_config",
	"gitcommit",
	"gitignore",
	"groovy",
	"go",
	"heex",
	"html",
	"http",
	"java",
	"javascript",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"python",
	"regex",
	"rst",
	"rust",
	"ssh_config",
	"sql",
	"typst",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
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

vim.api.nvim_create_autocmd("FileType", {
	pattern = patterns,
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
})

vim.keymap.set("v", "<leader>tt", ":!toilet -w 200 -f term -F border<CR>")
vim.keymap.set("v", "<leader>'", "c''<Esc>P")
vim.keymap.set("v", '<leader>"', 'c""<Esc>P')

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("n", "<leader>h", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
