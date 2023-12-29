-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- Show only modifed buffer_start
-- https://github.com/NvChad/ui/issues/78
-- vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
--   callback = function()
--     vim.t.bufs = vim.tbl_filter(function(bufnr)
--       return vim.api.nvim_buf_get_option(bufnr, "modified")
--     end, vim.t.bufs)
--   end,
-- })
require "custom.autocmds"
require "custom.mappings"
require "custom.abbreviations"
require "custom.options"

vim.filetype.add { extension = { hcl = "terraform" } }
vim.g.snipmate_snippets_path = "~/.config/nvim/lua/custom/snippets"
vim.g.vscode_snippets_path = "~/.config/nvim/lua/custom/vscode_snippets"
