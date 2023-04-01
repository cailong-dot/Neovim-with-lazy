-- 设置主键
vim.g.mapleader = " " 
-- 使用lazy管理插件
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {import = "startup"},
  -- 引入主题文件夹
  {import = "themes"},
  -- 引入插件文件夹
  {import = "plugins"},
  -- 引入lsp服务
  {import = "lsp"},
  -- 引入基本设置文件
  {import = 'options.options'},
  -- 引入快捷键绑定文件
  {import = 'keymaps.keymaps'},
})

vim.cmd[[colorscheme onedark]]
