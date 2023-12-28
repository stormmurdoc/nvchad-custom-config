---@type MappingsTable
local M = {}

-- General keybinds
M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>rb"] = { "<cmd>! ~/.local/bin/open % <CR>", "Execute current buffer" },
    ["<leader>rs"] = { "<cmd>! shellcheck % <CR>", "Execute shellcheck for the current buffer" },
    ["<leader>c"]  = {
      function()
        vim.cmd[[
          :write
          :! ~/.local/bin/autocomp.sh "%:p"
        ]]
      end,
      "Execute auto compile script",
    },
    ["<leader>p"]  = { "<cmd>:! opout %:p<CR>" },
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
  i = {
    ["<C-a>"] = { "<ESC>^i", "Move cursor beginning of line" },
  }
}

-- binding for Telescope
M.telescope = {
  n = {
    -- find
    ["<leader>ss"] = { "<cmd> Telescope grep_string <cr>", "Search under your cursor" },
  },
}

-- binding for Markdown Preview
M.mdpreview = {
  n = {
    ["<leader>mp"] = { "<cmd> MarkdownPreview<CR>", "Open Preview"},
    ["<leader>mc"] = { "<cmd> MarkdownPreviewStop<CR>", "Close Preview"},
    },
}
-- more keybinds!

return M
