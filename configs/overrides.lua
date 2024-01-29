local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "vimdoc",
    "lua",
    "hcl",
    "hurl",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    "ansible-lint",
    "ansible-language-server",
    "bash-language-server",
    "clang-format",
    "clangd",
    "css-lsp",
    "deno",
    "docker-compose-language-service",
    "dockerfile-language-server",
    "hadolint",
    "html-lsp",
    "json-lsp",
    "lua-language-server",
    "markdown-toc",
    "markdownlint",
    "prettier",
    "pyre",
    "shellcheck",
    "stylua",
    "terraform-ls",
    "tflint",
    "typescript-language-server",
    "yaml-language-server",
    "yamlfix",
    "yamllint",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
