local conditions = require "heirline.conditions"

return {
  condition = conditions.lsp_attached,
  update = {'LspAttach', 'LspDetach'},
  {
    provider = " ",
    hl = { bg = "normal_bg" }
  },
  {
    provider  = function()
      local names = {}
      for _, server in pairs(vim.lsp.buf_get_clients(0)) do
        table.insert(names, server.name)
      end
      return table.concat(names, " ")
    end,
    hl = { fg = "green", bold = true, bg = "normal_bg" },
  },
  {
    provider = " ",
    hl = { bg = "normal_bg" }
  },
}
