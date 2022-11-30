local conditions = require "heirline.conditions"

return {
  condition = conditions.has_diagnostics,

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,

  update = { "DiagnosticChanged", "BufEnter" },

  {
    provider = function(self)
      return self.errors > 0 and (" " .. " " .. self.errors .. " ")
    end,
    hl = { fg = "red" },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (" " .. " " .. self.warnings .. " ")
    end,
    hl = { fg = "orange" },
  },
  {
    provider = function(self)
      return self.info > 0 and (" " .. " " .. self.info .. " ")
    end,
    hl = { fg = "blue" },
  },
  {
    provider = function(self)
      return self.hints > 0 and (" " .. " " .. self.hints .. " ")
    end,
    hl = { fg = "green" },
  },

  hl = { bg = "normal_bg" }
}
