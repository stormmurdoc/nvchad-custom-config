local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers =
  {
    "ansiblels",
    "bashls",
    "clangd",
    "cssls",
    "dockerls",
    "eslint",
    "gopls",
    "html",
    "jsonls",
    "pyright",
    "terraformls",
    "tflint",
    "trivy",
    "tsserver",
    "yamlls",
  }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig.terraformls.setup({
  filetypes = {"terraform", "tfvar", "tf"},
})--

lspconfig.ansiblels.setup({
  filetypes = {"yaml.ansible"},
  settings = {
    ansible = {
      ansible = {
        path = "ansible"
      },
      executionEnvironment = {
        enabled = false
      },
      python = {
        interpreterPath = "python"
      },
      validation = {
        enabled = true,
        lint = {
          enabled = true,
          path = "ansible-lint"
        }
      }
    }
  }
})
