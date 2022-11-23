local kanagawa_exists, kanagawa = pcall(require, "kanagawa")
if not kanagawa_exists then return end

kanagawa.setup({
  undercurl = true,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true},
  statementStyle = { bold = true },
  typeStyle = {},
  variablebuiltinStyle = { italic = true},
  specialReturn = true,
  specialException = true,
  transparent = true,
  dimInactive = false,
  globalStatus = false,
  terminalColors = true,
  colors = {},
  overrides = {},
  theme = "dark",
  vim.cmd("colorscheme kanagawa"),
})
