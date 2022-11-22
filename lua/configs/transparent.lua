local transparent_exists, transparent = pcall(require, "transparent")
if not transparent_exists then return end

transparent.setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups
    "FloatBorder",
    "TelescopePromptBorder",
    "TelescopeBorder",
    -- example of akinsho/nvim-bufferline.lua
  },

  -- extra_groups = 'all',
  exclude = {
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  }, -- table: groups you don't want to clear
})
