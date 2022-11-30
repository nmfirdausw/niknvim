return {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = " ",
    hl = { fg = "modified" },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = "",
    hl = { fg = "orange" },
  },
}
