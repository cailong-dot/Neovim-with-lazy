local M = {}
vim.g.mapleader = " "

local keymap = vim.keymap
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Better window navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)

-- ---------- 插入模式 ---------- ---
keymap.set("i", "jk", "<ESC>")

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
-- keymap.set("n", "<leader>nh", ":nohl<CR>")

-- 切换buffer
keymap.set("n", "<S-L>", ":bnext<CR>")
keymap.set("n", "<S-H>", ":bprevious<CR>")

return M
