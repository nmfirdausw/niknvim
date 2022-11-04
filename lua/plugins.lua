return {

  ["lewis6991/impatient.nvim"] = {},

	["nvim-lua/plenary.nvim"] = { module = "plenary" },

	["wbthomason/packer.nvim"] = {
		cmd = { "PackerSync" },
  	config = function() require "plugins" end,
	},

  ['rebelot/kanagawa.nvim'] = {
    as = 'kanagawa',
    config = function() require "configs.kanagawa" end,
  },

}
