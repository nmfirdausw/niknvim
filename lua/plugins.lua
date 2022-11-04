return {

	["nvim-lua/plenary.nvim"] = { module = "plenary" },

	["wbthomason/packer.nvim"] = {
		cmd = { "PackerSync" },
		config = function() require "plugins" end,
	},

}
