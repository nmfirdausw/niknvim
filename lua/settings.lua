local opt = {
  backspace = vim.opt.backspace + { "nostop" },
	clipboard = "unnamed,unnamedplus",
	cmdheight = 0,
	completeopt = { "menuone", "noselect" },
	copyindent = true,
	cursorcolumn = true, cursorline = true,
	expandtab = true,
	fileencoding = "utf-8",
	fillchars = { eob = " " },
	history = 100,
	ignorecase = true,
	laststatus = 3,
	lazyredraw = true,
	mouse = "a",
	number = true,
	numberwidth = 1,
	preserveindent = true,
	pumheight = 10,
	relativenumber = true,
	scrolloff = 8,
	shiftwidth = 2,
	showmode = false,
	sidescrolloff = 8,
	signcolumn = "yes",
	smartcase = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	tabstop = 2,
	termguicolors = true,
	timeoutlen = 300,
	undofile = true,
	updatetime = 300,
	wrap = false,
	writebackup = false,
}

local g = {
  mapleader = " ",
}

local default_plugins = {
}

for _, value in pairs(default_plugins) do
  g["loaded_" .. value] = true
end

for key, value in pairs(opt) do
	vim.opt[key] = value
end

for key, value in pairs(g) do
	vim.g[key] = value
end
