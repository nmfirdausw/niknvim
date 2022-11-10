return {

  ["lewis6991/impatient.nvim"] = {},

	["nvim-lua/plenary.nvim"] = { module = "plenary" },

  ["MunifTanjim/nui.nvim"] = { module = "nui" },

	["wbthomason/packer.nvim"] = {
		cmd = { "PackerSync" },
  	config = function() require "plugins" end,
	},

  ['rebelot/kanagawa.nvim'] = {
    as = 'kanagawa',
    config = function() require "configs.kanagawa" end,
  },

  ["kyazdani42/nvim-web-devicons"] = {
		module = "nvim-web-devicons",
		config = function() require "configs.web-devicons" end,
	},

	["nvim-neo-tree/neo-tree.nvim"] = {
		branch = "v2.x",
		module = "neo-tree",
		cmd = "Neotree",
		setup = function() vim.g.neo_tree_remove_legacy_commands = true end,
		config = function() require "configs.neo-tree" end,
  },

  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    module = "telescope",
    config = function() require "configs.telescope" end,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    run = function() require("nvim-treesitter.install").update { with_sync = true } end,
    event = "BufEnter",
    config = function() require "configs.treesitter" end,
  },
}
