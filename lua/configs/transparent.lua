local transparent_exists, transparent = pcall(require, "transparent")
if not transparent_exists then return end

transparent.setup({
  enable = true, -- boolean: enable transparent
  extra_groups = {
    "FloatBorder",
    "TelescopePromptBorder",
    "TelescopeBorder",
    "NeotreeNormal",
    "StatusLine",
    "Winbar",
    "WinbarNC",
    "NormalFloat",
  },

  exclude = {
  },
})
