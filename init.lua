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

--setup Telescope
local builtin = require("telescope.builtin")

--setup treesitter
local configs = require("nvim-treesitter.configs")
configs.setup({
	ensure_installed = {"lua", "python"},
	highlight = {enable = true},
	indent = {enable = true},
})

--keymaps
--Telescope
vim.keymap.set('n', '<C-p>', builtin.find_files, {})

--find grep
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

--launch neotree
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {}) 
