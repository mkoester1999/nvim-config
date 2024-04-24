-- set numbers and get rid of tildas
vim.cmd("set number")
vim.opt.fillchars = { eob = " " }
vim.g.mapleader = " "

-- install Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

-- run lazy setup. "Plugins" option pulls from lua/plugins.lua 
require("lazy").setup("plugins")


