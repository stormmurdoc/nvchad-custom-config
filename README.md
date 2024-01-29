# NvChad Custom Config

This can be used as an example custom config for NvChad.
Do check the [https://github.com/NvChad/nvcommunity
](https://github.com/NvChad/nvcommunity)

## Table of Content

<!-- toc -->

- [Installation](#installation)
- [Links](#links)

<!-- tocstop -->

## Installation

First make a backup of your nvim config.

```shell
# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim/

# Windows
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data
```

For linux/macos:

```shell
git clone https://github.com/NvChad/NvChad ~/.config/nvim \
--depth 1 && git clone https://github.com/stormmurdoc/nvchad-custom-config \
~/.config/nvim/lua/custom --depth 1 && nvim
```

For windows:

```shell
git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim \
--depth 1 && git clone https://github.com/stormmurdoc/nvchad-custom-config \
$HOME\AppData\Local\nvim\lua\custom --depth 1 && nvim
```

Further information can be found [here](https://nvchad.com/docs/quickstart/install).

## Links

- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [lua snippets](https://github.com/L3MON4D3/LuaSnip)
- [lua friendly snippets](https://github.com/rafamadriz/friendly-snippets)
- [lazy.vim](https://github.com/folke/lazy.nvim)
- [which-key](https://github.com/folke/which-key.nvim)
- [nvim-colorizer](https://github.com/NvChad/nvim-colorizer.lua)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [https://github.com/sar/friendly-snippets.nvim](https://github.com/sar/friendly-snippets.nvim)
