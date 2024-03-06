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
    opt.filetype = "markdown"
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

-- set hurl files
vim.cmd([[
   autocmd BufRead,BufNewFile *.hurl setlocal filetype=hurl
]])

vim.cmd([[
   autocmd BufWritePost *md !markdown-toc -i %
]])

-- vim.cmd [[
--    autocmd BufWritePost ~/.local/bin/* !shellcheck %
-- ]]

-- execute xrdb if a Xresources file is written
vim.cmd([[
   autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
]])

-- execute hadolint
vim.cmd([[
   autocmd BufWritePost *Dockerfile !hadolint %
]])

vim.cmd([[
   autocmd BufWritePost *.desktop !desktop-file-validate %
]])

-- clear tex files after closing vim
vim.cmd([[
   autocmd VimLeave *.tex !texclear %
]])

-- templates
vim.cmd([[
  autocmd BufNewFile brief.tex 0r ~/.config/templates/brief.tex
  autocmd BufNewFile *.dot 0r ~/.config/templates/template.dot
  autocmd BufNewFile *.sh 0r ~/.config/templates/template.sh
  autocmd BufNewFile *.sent 0r ~/.config/templates/template.sent
  autocmd BufNewFile *.c 0r ~/.config/templates/template.c
  autocmd BufNewFile brief.tex 0r ~/.config/templates/brief.tex
  autocmd BufNewFile doc.tex 0r ~/.config/templates/template.tex
]])

-- Automatically deletes all trailing whitespace on save.
vim.cmd([[
  autocmd BufWritePre * %s/\s\+$//e
]])

-- move visual block vertically
vim.cmd([[
  xnoremap J :m '>+1<CR>gv=gv
  xnoremap K :m '<-2<CR>gv=gv
]])

-- fast replace strings
vim.cmd([[
  nmap <leader>r :%s/<C-r><C-w>//gc<Left><Left><Left>
]])

-- vimwiki au group

vim.cmd([[
  augroup vimwikigroup
   autocmd!
   " automatically update links on read diary
   autocmd BufRead,BufNewFile ~/ownCloud/vimwiki/diary/diary.md VimwikiDiaryGenerateLinks
  augroup end

  au BufNewFile ~/ownCloud/vimwiki/diary/*.md :silent 0r !~/.config/vim/bin/generate-vimwiki-diary-template '%'
]])

-- Transparent editing of gpg encrypted files.
vim.cmd([[
  augroup encrypted
    au!
    " First make sure nothing is written to ~/.viminfo while editing
    " an encrypted file.
    autocmd BufReadPre,FileReadPre *.gpg set viminfo=
    " We don't want a swap file, as it writes unencrypted data to disk
    autocmd BufReadPre,FileReadPre *.gpg set noswapfile
    " Switch to binary mode to read the encrypted file
    autocmd BufReadPre,FileReadPre *.gpg set bin
    autocmd BufReadPre,FileReadPre *.gpg let ch_save = &ch|set ch=2
    " (If you use tcsh, you may need to alter this line.)
    autocmd BufReadPost,FileReadPost *.gpg '[,']!gpg --decrypt 2> /dev/null
    " Switch to normal mode for editing
    autocmd BufReadPost,FileReadPost *.gpg set nobin
    autocmd BufReadPost,FileReadPost *.gpg let &ch = ch_save|unlet ch_save
    autocmd BufReadPost,FileReadPost *.gpg execute ":doautocmd BufReadPost " . expand("%:r")
    " Convert all text to encrypted text before writing
    " (If you use tcsh, you may need to alter this line.)
    autocmd BufWritePre,FileWritePre *.gpg '[,']!gpg --default-recipient-self -ae 2>/dev/null
    " Undo the encryption so we are back in the normal text, directly
    " after the file has been written.
    autocmd BufWritePost,FileWritePost *.gpg u
  augroup END
]])
