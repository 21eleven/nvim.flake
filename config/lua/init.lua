vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.autowriteall = true
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.laststatus = 3
vim.o.hlsearch = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.cursorline = true
-- vim.o.guifont = "Azeret Mono,Hack Nerd Font Mono,Noto Color Emoji,NotoEmoji Nerd Font:h16"
vim.o.mouse = 'a'
vim.o.breakindent = true
vim.opt.undofile = true
--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.o.termguicolors = true
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.g.python_host_prog = "python"
vim.o.background = 'dark'
vim.o.shell = '/usr/bin/env fish'
