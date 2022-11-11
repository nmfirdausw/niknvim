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

  ["akinsho/bufferline.nvim"] = {
    module = "bufferline",
    event = "UIEnter",
    config = function() require "configs.bufferline" end,
  },

  ["famiu/bufdelete.nvim"] = { 
    module = "bufdelete", 
    cmd = { "Bdelete", "Bwipeout" } 
  },

  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    module = "telescope",
    config = function() require "configs.telescope" end,
  },

  ["akinsho/toggleterm.nvim"] = {
    cmd = { "ToggleTerm", "TermExec" },
    module = { "toggleterm", "toggleterm.terminal" },
    config = function() require "configs.toggleterm" end,
  },

  ["Darazaki/indent-o-matic"] = {
    event = "BufEnter",
    config = function() require "configs.indent-o-matic" end,
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    event = "BufEnter",
    config = function() require "configs.indent-blankline" end,
  },

  ["lewis6991/gitsigns.nvim"] = {
    event = "BufEnter",
    config = function() require "configs.gitsigns" end,
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    run = function() require("nvim-treesitter.install").update { with_sync = true } end,
    event = "BufEnter",
    config = function() require "configs.treesitter" end,
  },

  ["JoosepAlviste/nvim-ts-context-commentstring"] = { after = "nvim-treesitter" },

  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },

  ["windwp/nvim-ts-autotag"] = { after = "nvim-treesitter" },

  ["numToStr/Comment.nvim"] = {
    module = { "Comment", "Comment.api" },
    keys = { "gc", "gb" },
    config = function() require "configs.comment" end,
  },
}
