local conditions = require("heirline.conditions")

return {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = { fg = "orange", bg = "normal_bg" },

  {
    provider = function(self)
        return "  " .. self.status_dict.head .. " "
    end,
    hl = { bold = true }
  },
}
