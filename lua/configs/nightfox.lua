local nightfox_exists, nightfox = pcall(require, "nightfox")
if not nightfox_exists then return end

nightfox.setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {
    all = {
      -- StatusLine = { fg = "#ffffff", bg = "#254147" },
      -- NeoTreeTabActive = { fg = "#fda47f", bg = "#254147" },
      -- NeoTreeTabInactive = { fg = "#ffffff", bg = "#254147" },
      -- NeoTreeTabSeparatorInactive = { fg = "#254147", bg = "#254147" },
      -- NeoTreeTabSeparatorActive = { fg = "#254147", bg = "#254147" },

      StatusLine = { fg = "#ffffff", bg = "#444c5e" },
      NeoTreeTabActive = { fg = "#ebcb8b", bg = "#444c5e" },
      NeoTreeTabInactive = { fg = "#ffffff", bg = "#444c5e" },
      NeoTreeTabSeparatorInactive = { fg = "#444c5e", bg = "#444c5e" },
      NeoTreeTabSeparatorActive = { fg = "#444c5e", bg = "#444c5e" },
    },
  },
})

-- setup must be called before loading
vim.cmd("colorscheme nordfox")
