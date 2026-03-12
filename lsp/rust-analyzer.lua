return {
  cmd = { "rust-analyzer" },
  root_markers = { "Cargo.lock", "Cargo.toml", ".git" }, -- Adicionei Cargo.toml por segurança
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = true, 
      check = {
        command = "clippy",
      },
      diagnostics = {
        enable = true,
        disabled = { "unlinked-file" },
      },
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      procMacro = {
        enable = true,
      },
    },
  },
}


