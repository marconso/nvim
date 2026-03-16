local ts = require("nvim-treesitter")
local parsers = {
  "bash", "dockerfile", "elixir", "git_config",
  "gitcommit", "gitignore", "groovy", "go", "heex", "html", "http",
  "java", "javascript", "lua", "make", "markdown",
  "markdown_inline", "python", "regex", "rst", "rust", "ssh_config",
  "sql", "typst", "toml", "tsx", "typescript", "vim", "vimdoc",
  "yaml",
}

-- Install parsers
for _, parser in ipairs(parsers) do
  ts.install(parser)
end

-- Register filetypes that don't match parser names (e.g., tsx → typescriptreact)
local patterns = {}
for _, parser in ipairs(parsers) do
  local parser_patterns = vim.treesitter.language.get_filetypes(parser)
  for _, pp in pairs(parser_patterns) do
    table.insert(patterns, pp)
  end
end
vim.treesitter.language.register("groovy", "Jenkinsfile")

-- Enable syntax highlighting, indentation, and folding
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.wo.foldmethod = "expr"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

-- Auto-start Treesitter on supported filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = patterns,
  callback = function()
    vim.treesitter.start()
  end,
})
