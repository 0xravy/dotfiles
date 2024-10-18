-- this plugin for searching

return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'ahmedkhalf/project.nvim',
		},
		config = function()
			require('project_nvim').setup {
				detection_methods = { "lsp", "pattern" },
				patterns = { ".git", "Makefile", "package.json" },
				projects = {
					"~/coding/projects/*",
					"~/coding/test/*",
					"~/.config/*",
				},
			}

			require('telescope').load_extension('projects')


			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
			vim.keymap.set('n', '<leader>fw', "<cmd>Telescope projects<cr>", { desc = 'Telescope change workspace' })
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			-- This is your opts table
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {}
					}
				}
			}
			require("telescope").load_extension("ui-select")
		end
	}
}
