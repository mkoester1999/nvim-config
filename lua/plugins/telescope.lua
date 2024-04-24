return
{
	'nvim-telescope/telescope.nvim', tag = '0.1.6',
	dependencies = { 'nvim-lua/plenary.nvim' },
	
	config = function()

		local builtin = require("telescope.builtin")

		--keymaps
		--Telescope
		vim.keymap.set('n', '<C-p>', builtin.find_files, {})

		--find grep
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	end
		
}

