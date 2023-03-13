require("mason-lspconfig").setup({
  ensure_installed = { "bashls", "clangd", "jdtls", "lua_ls", "rust_analyzer", "gopls" }
})
