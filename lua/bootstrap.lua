local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"

local ensure_packer = function()
	if fn.empty(fn.glob(install_path)) > 0 then
		print "Installing Packer ..."
		fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()
vim.cmd "packadd packer.nvim"
local packer = require "packer"
local plugins = require "plugins"
packer.startup {
	function(use)
		for key, plugin in pairs(plugins) do
			if type(key) == "string" and not plugin[1] then plugin[1] = key end
				use(plugin)
      end
	end,
	config = {
		profile = {
			enable = true,
			threshold = 0.0001,
		},
		git = {
			clone_timeout = 300,
			subcommands = {
				update = "pull --rebase",
			},
		},
		auto_clean = true,
		compile_on_sync = true,
	},
}
if packer_bootstrap then
	packer.sync()

  vim.api.nvim_create_autocmd("User", {
    pattern = "PackerComplete",
    callback = function()
      vim.cmd "bw | silent! MasonInstallAll"
      require("packer").loader "nvim-treesitter"
    end,
  })
end
