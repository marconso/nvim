local lspconfig_ok, lspconfig = pcall(require, "vim.lsp.config")
if not lspconfig_ok then
  return
end

-- mason setup
pcall(function()
  require("mason").setup()
  require("mason-lspconfig").setup({ automatic_installation = true })
end)

-- enhance capabilities for nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_nvim_lsp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

-- common on_attach
local on_attach = function(client, bufnr)
  local bufmap = function(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, noremap = true, silent = true })
  end
  bufmap('n', 'gd', vim.lsp.buf.definition)
  bufmap('n', 'K', vim.lsp.buf.hover)
  bufmap('n', 'gi', vim.lsp.buf.implementation)
  bufmap('n', '<leader>rn', vim.lsp.buf.rename)
  bufmap('n', '<leader>ca', vim.lsp.buf.code_action)
  bufmap('n', '<leader>f', function() vim.lsp.buf.format { async = true } end)
end

-- servers to ensure installed (mason will auto-install)
local servers = { "pyright", "ts_ls", "lua_ls", "gopls", "bashls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- null-ls (formatters / linters)
-- pcall(function()
--   local null_ls = require("null-ls")
--   null_ls.setup({
--     sources = {
--       null_ls.builtins.formatting.prettier,
--       null_ls.builtins.formatting.black,
--       null_ls.builtins.diagnostics.flake8,
--     },
--   })
-- end)
