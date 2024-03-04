---@type MappingsTable
local M = {}

-- General keybinds
M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>rb"] = { "<cmd>! ~/.local/bin/open % <CR>", "Execute current buffer" },
    ["<leader>rs"] = { "<cmd>! shellcheck % <CR>", "Execute shellcheck for the current buffer" },
    ["<leader>c"] = {
      function()
        vim.cmd([[
          :write
          :! ~/.local/bin/autocomp.sh "%:p"
        ]])
      end,
      "Execute auto compile script",
    },
    ["<leader>p"] = { "<cmd>:! opout %:p<CR>" },
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },
    ["<leader><ENTER>"] = {
      function()
        vim.cmd([[
          :ZenMode
        ]])
      end, "Toggle ZenMode"
    },
    ["<leader>gg"] = {
      function()
        local nvterm = require("nvterm.terminal")
        nvterm.send("lazygit && exit", "float")
        nvterm.toggle "float"
        nvterm.toggle "float"
      end, "open Lazygit",
    },

    ["<leader>mm"] = {
      function ()
        vim.cmd([[
          :MarkmapWatch
        ]])
      end, "Open Markmap Watch",
    },

    ["<leader>ms"] = {
      function ()
        vim.cmd([[
          :MarkmapWatchStop
        ]])
      end, "Stop Markmap Watch",
    },


    ["<leader>l"] = {
      function ()
          require("cmp").setup { enabled = true }
      end, "Enable LSP completion",
    },

    ["<leader>L"] = {
      function ()
          require("cmp").setup { enabled = false }
      end, "Disable LSP completion",
    },
},

  v = {
    [">"] = { ">gv", "indent" },
  },
  i = {
    ["<C-a>"] = { "<ESC>^i", "Move cursor beginning of line" },
  },
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
    ["<leader>mp"] = { "<cmd> MarkdownPreview<CR>", "Open Preview" },
    ["<leader>mc"] = { "<cmd> MarkdownPreviewStop<CR>", "Close Preview" },
  },
}

M.gitsigns = {
  n = {
    ["<leader>gp"] = { "<cmd> Gitsigns preview_hunk<CR>", "Preview Hunk" },
    ["<leader>gt"] = { "<cmd> Gitsigns toggle_current_line_blame<CR>", "Toggle current line blame" },
  },
}
-- more keybinds!

return M
