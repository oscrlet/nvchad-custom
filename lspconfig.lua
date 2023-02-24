local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--clang-tidy",
  },
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
