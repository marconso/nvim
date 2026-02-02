return {
  -- Mantemos os comandos que já funcionam para você
  cmd = { "rust-analyzer" },
  root_markers = { "Cargo.lock", "Cargo.toml", ".git" }, -- Adicionei Cargo.toml por segurança
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      -- Isso resolve o problema de precisar salvar para aparecer erro
      checkOnSave = true, 
      check = {
        command = "clippy",
      },
      diagnostics = {
        enable = true,
        -- A forma correta de desabilitar o warning de arquivo solto:
        disabled = { "unlinked-file" },
      },
      -- Habilita suporte experimental para arquivos fora de projetos (autocomplete)
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      -- Tenta carregar informações mesmo sem um workspace
      procMacro = {
        enable = true,
      },
    },
  },
}


