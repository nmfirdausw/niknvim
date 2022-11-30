return {
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()
    if not self.once then
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:*o",
        command = 'redrawstatus'
      })
      self.once = true
    end
  end,
  static = {
    mode_colors = {
      n = "cyan" ,
      i = "green",
      v = "purple",
      V =  "purple",
      ["\22"] =  "purple",
      c =  "orange",
      s =  "purple",
      S =  "purple",
      ["\19"] =  "purple",
      R =  "red",
      r =  "red",
      ["!"] =  "blue",
      t =  "blue",
    }
  },

  provider = function()
    return " "
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1) -- get only the first mode character
    return { bg = self.mode_colors[mode], bold = true, }
  end,
  update = {
    "ModeChanged",
  },
}
