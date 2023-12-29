-- auto commands

local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- set automatic tabstop and so on depending on filetype
-- python
autocmd("FileType", {
  pattern = "python",
  callback = function()
    opt.wrap = true
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
    opt.expandtab = true
    opt.smarttab = true
  end,
})

-- shell
autocmd("FileType", {
  pattern = "sh",
  callback = function()
    opt.wrap = true
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
    opt.expandtab = true
    opt.smarttab = true
  end,
})

-- javascript
autocmd("FileType", {
  pattern = "javascript",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
    opt.expandtab = true
    opt.smarttab = true
  end,
})

-- typescriptreact
autocmd("FileType", {
  pattern = "typescript",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
    opt.expandtab = true
    opt.smarttab = true
  end,
})

-- javascriptreact
autocmd("FileType", {
  pattern = "javascriptreact",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
    opt.expandtab = true
    opt.smarttab = true
  end,
})

-- typescriptreact
autocmd("FileType", {
  pattern = "typescriptreact",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
    opt.expandtab = true
    opt.smarttab = true
  end,
})

-- json
autocmd("FileType", {
  pattern = "json",
  callback = function()
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
    opt.expandtab = true
    opt.smarttab = true
  end,
})

-- markdown, text files
autocmd("FileType", {
  pattern = "markdown,txt",
  callback = function()
    opt.wrap = true
    opt.tabstop = 4
    opt.shiftwidth = 4
    opt.softtabstop = 4
    opt.expandtab = true
    opt.smarttab = true
  end,
})

-- yaml files
autocmd("FileType", {
  pattern = "yaml",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
    opt.expandtab = true
    opt.smarttab = true
  end,
})

-- lua
autocmd("FileType", {
  pattern = "lua",
  callback = function()
    opt.tabstop = 2
    opt.shiftwidth = 2
    opt.softtabstop = 2
    opt.expandtab = true
    opt.smarttab = true
  end,
})

-- terraform
autocmd("FileType", {
  pattern = "tf",
  callback = function()
    opt.filetype = "terraform"
  end,
})

-- ansible template
autocmd("FileType", {
  pattern = "j2",
  callback = function()
    opt.filetype = "yaml.ansible"
  end,
})

-- ansible hosts
autocmd("FileType", {
  pattern = "hosts",
  callback = function()
    opt.filetype = "yaml.ansible"
  end,
})

-- ansible yamls
autocmd("FileType", {
  pattern = "*/workspace/git/ansible/(*.yml,*yaml,*/{group,host}_vars/*)",
  callback = function()
    opt.filetype = "yaml.ansible"
  end,
})



-- automatic perform a shellcheck if a shell scrippt is written
vim.cmd [[
   autocmd FileType sh autocmd BufWritePre <buffer> ! shellcheck %
]]

vim.cmd [[
   autocmd BufWritePost *md !markdown-toc -i %
]]

vim.cmd [[
   autocmd BufWritePost ~/.local/bin/* !shellcheck %
]]

-- execute xrdb if a Xresources file is written
vim.cmd [[
   autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
]]

-- execute hadolint
vim.cmd [[
   autocmd BufWritePost *Dockerfile !hadolint %
]]

vim.cmd [[
   autocmd BufWritePost *.desktop !desktop-file-validate %
]]

-- clear tex files after closing vim
vim.cmd [[
   autocmd VimLeave *.tex !texclear %
]]

-- templates
vim.cmd [[
  autocmd BufNewFile brief.tex 0r ~/.config/templates/brief.tex
  autocmd BufNewFile *.dot 0r ~/.config/templates/template.dot
  autocmd BufNewFile *.sh 0r ~/.config/templates/template.sh
  autocmd BufNewFile *.sent 0r ~/.config/templates/template.sent
  autocmd BufNewFile *.c 0r ~/.config/templates/template.c
  autocmd BufNewFile brief.tex 0r ~/.config/templates/brief.tex
  autocmd BufNewFile doc.tex 0r ~/.config/templates/template.tex
]]

-- Automatically deletes all trailing whitespace on save.
vim.cmd [[
  autocmd BufWritePre * %s/\s\+$//e
]]


-- move visual block vertically
vim.cmd [[
  xnoremap J :m '>+1<CR>gv=gv
  xnoremap K :m '<-2<CR>gv=gv
]]

-- fast replace strings
vim.cmd [[
  nmap <leader>r :%s/<C-r><C-w>//gc<Left><Left><Left>
]]
