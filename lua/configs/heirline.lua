local heirline_exists, heirline = pcall(require, "heirline")
if not heirline_exists then return end

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local colors = {
  green = utils.get_highlight("MiniStatuslineModeInsert").bg,
  cyan = utils.get_highlight("MiniStatuslineModeNormal").bg,
  blue = utils.get_highlight("MiniStatuslineModeOther").bg,
  purple = utils.get_highlight("MiniStatuslineModeVisual").bg,
  orange = utils.get_highlight("MiniStatuslineModeCommand").bg,
  red = utils.get_highlight("MiniStatuslineModeReplace").bg,
  modified = "#d7d787",
  normal_bg = utils.get_highlight("CursorLine").bg,
}

heirline.load_colors(colors)

local vimode = {
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

local git_branch = {
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

local file_name_block = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
  hl = { bg = "normal_bg" }
}

local file_icon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return " " .. self.icon and (" " .. self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end
}

local file_name = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "[No Name]" end
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename .. " "
  end,
  hl = { fg = utils.get_highlight("Directory").fg },
}

local file_flags = {
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

local file_name_modifier = {
  hl = function()
    if vim.bo.modified then
      return { fg = "cyan", bold = true, force=true }
    end
  end,
}

file_name_block = utils.insert(file_name_block,
  file_icon,
  utils.insert(file_name_modifier, file_name),
  unpack(file_flags),
  { provider = '%<'}
)

local space = {
  provider = " ",
  hl = { bg = "normal_bg", }
}

local git_status = {
  condition = conditions.is_git_repo,

  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
  end,

  hl = { fg = "orange", bg = "normal_bg" },

  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and ("  " .. count .. " ")
    end,
    hl = { fg = "green" },
  },
  {
      provider = function(self)
          local count = self.status_dict.removed or 0
          return count > 0 and ("  " .. count .. " ")
      end,
      hl = { fg = "red" },
  },
  {
      provider = function(self)
          local count = self.status_dict.changed or 0
          return count > 0 and ("  " .. count .. " ")
      end,
      hl = { fg = "orange" },
  },
}

local diagnostics = {
  condition = conditions.has_diagnostics,

  static = {
    error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
    warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
    info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
    hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
  },

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,

  update = { "DiagnosticChanged", "BufEnter" },

  {
    provider = function(self)
      return self.errors > 0 and (" " .. self.error_icon .. self.errors .. " ")
    end,
    hl = { fg = "red" },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (" " .. self.warn_icon .. self.warnings .. " ")
    end,
    hl = { fg = "orange" },
  },
  {
    provider = function(self)
      return self.info > 0 and (" " .. self.info_icon .. self.info .. " ")
    end,
    hl = { fg = "blue" },
  },
  {
    provider = function(self, sd)
      return self.hints > 0 and (" " .. self.hint_icon .. self.hints .. " ")
    end,
    hl = { fg = "green" },
  },

  hl = { bg = "normal_bg" }
}

local align = { provider = "%=" }

local scroll_bar ={
  static = {
    sbar = { ' ','▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
  },
  provider = function(self)
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
    return string.rep(self.sbar[i], 2)
  end,
  hl = { fg = "orange", bg = "blue" },
}

local lsp_active = {
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

local ruler = {
    provider = " " .. "%7(%l/%3L%):%2c %P",
    hl = { fg = "cyan", bg = "normal_bg" }
}

local terminal_name = {
    provider = function()
        local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
        return " " .. tname
    end,
    hl = { fg = "blue", bold = true },
}

local file_type = {
  provider = function()
    return string.upper(vim.bo.filetype)
  end,
  hl = { fg = utils.get_highlight("Type").fg, bold = true },
}

local terminal_status_line = {
  condition = function()
      return conditions.buffer_matches({ buftype = { "terminal" } })
  end,

  hl = { bg = "normal_bg" },

  { condition = conditions.is_active, vimode, space }, file_type, space, terminal_name, align,
}

local default_statusline = {
  condition = function()
    return not conditions.buffer_matches({ buftype = { "terminal" } })
  end,
  vimode, git_branch, file_name_block, git_status, diagnostics, vimode, align,
  vimode, space, lsp_active, ruler, space, scroll_bar,space, vimode
}

local status_line = { terminal_status_line, default_statusline }

heirline.setup(status_line)
