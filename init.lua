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

local plugins = 
{
	--Catpuccin color theme
	{"catppuccin/nvim", name = "catppuccin", priority = 1000},
    	--Telescope
	{
    		'nvim-telescope/telescope.nvim', tag = '0.1.6',
      		dependencies = { 'nvim-lua/plenary.nvim' }
    	},
	--Treesitter
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}

local opts = {}

require("lazy").setup(plugins, opts)

--setup Telescope
local builtin = require("telescope.builtin")

--setup treesitter
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"lua", "python", "cpp"},
	highlight = {enable = true},
	indent = {enable = true}
})
--setup catppuccin
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

--keymaps
--Telescope
vim.keymap.set('n', '<C-p>', builtin.find_files, {})

--find grep
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

