-- this plugin for dashboard


return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.header.val = {
			[[      /      \         __      _\( )/_ ]],
			[[   \  \  ,,  /  /   | /  \ |    /(O)\ ]],
			[[    '-.`\()/`.-'   \_\\  //_/    _.._   _\(o)/_  //  \\]],
			[[   .--_'(  )'_--.   .'/()\'.   .'    '.  /(_)\  _\\()//_]],
			[[  / /` /`""`\ `\ \   \\  //   /   __   \       / //  \\ \\]],
			[[   |  |  ><  |  |          ,  |   ><   |  ,     | \__/ |]],
			[[   \  \      /  /         . \  \      /  / .              _]],
			[[  _    '.__.'    _\(O)/_   \_'--`(  )'--'_/     __     _\(_)/_]],
			[[\( )/_            /(_)\      .--'/()\'--.    | /  \ |   /(O)\]],
			[[/(O)\  //  \\         _     /  /` '' `\  \  \_\\  //_/]],
			[[      _\\()//_     _\(_)/_    |        |      //()\\ ]],
			[[ravy / //  \\ \     /(o)\      \      /       \\  //]],
			[[      | \__/ |]],
		}

		alpha.setup(dashboard.opts)
		vim.keymap.set('n', '<leader>h', '<cmd>Alpha<cr>', { desc = 'dashboard page' })
	end,
}