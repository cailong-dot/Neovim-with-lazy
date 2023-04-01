local M = {}
local opt = vim.opt

local g = vim.g

local o = vim.o

local wo = vim.wo
-- 全局配置
g.python3_host_prog = "/usr/bin/python3.9"
o.timeout = true
o.timeoutlen = 300



-- 行号
opt.relativenumber = true
opt.number = true
-- wo.relativenumber = true

-- 缩进
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"

return M
