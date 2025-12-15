vim.lsp.enable({
    'pyright',
    'rust-analyzer',
    'bashls',
    'clangd',
    'marksman',
    'r_language_server'
})

-- -- mason setup
pcall(function()
  require("mason").setup()
  require("mason-lspconfig").setup({ automatic_installation = true })
end)
-- 
-- -- enhance capabilities for nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_nvim_lsp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end
-- 
-- -- common on_attach
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
