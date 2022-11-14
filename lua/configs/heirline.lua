local heirline_exists, heirline = pcall(require, "heirline")
if not heirline_exists then return end

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local colors = {
  bright_bg = utils.get_highlight("Folded").bg,
  bright_fg = utils.get_highlight("Folded").fg,
  red = utils.get_highlight("DiagnosticError").fg,
  dark_red = utils.get_highlight("DiffDelete").bg,
  green = utils.get_highlight("String").fg,
  blue = utils.get_highlight("Function").fg,
  gray = utils.get_highlight("NonText").fg,
  orange = utils.get_highlight("Constant").fg,
  purple = utils.get_highlight("Statement").fg,
  cyan = utils.get_highlight("Special").fg,
  diag_warn = utils.get_highlight("DiagnosticWarn").fg,
  diag_error = utils.get_highlight("DiagnosticError").fg,
  diag_hint = utils.get_highlight("DiagnosticHint").fg,
  diag_info = utils.get_highlight("DiagnosticInfo").fg,
  git_del = utils.get_highlight("diffDeleted").fg,
  git_add = utils.get_highlight("diffAdded").fg,
  git_change = utils.get_highlight("diffChanged").fg,
  default_bg = utils.get_highlight("StatusLine").fg,
}

require('heirline').load_colors(colors)

local vimode = {
  init = function(self)
    self.mode = vim.fn.mode(1)
    if not self.once then
      vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*:*o",
        command = 'redrawstatus'
      })
      self.once = true
    end
  end,

  static = {
    mode_names = {
      n = "N",
      no = "N?",
      nov = "N?",
      noV = "N?",
      ["no\22"] = "N?",
      niI = "Ni",
      niR = "Nr",
      niV = "Nv",
      nt = "Nt",
      v = "V",
      vs = "Vs",
      V = "V_",
      Vs = "Vs",
      ["\22"] = "^V",
      ["\22s"] = "^V",
      s = "S",
      S = "S_",
      ["\19"] = "^S",
      i = "I",
      ic = "Ic",
      ix = "Ix",
      R = "R",
      Rc = "Rc",
      Rx = "Rx",
      Rv = "Rv",
      Rvc = "Rv",
      Rvx = "Rv",
      c = "C",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "T",
    },
    mode_colors = {
      n = "green" ,
      i = "orange",
      v = "cyan",
      V =  "cyan",
      ["\22"] =  "cyan",
      c =  "orange",
      s =  "purple",
      S =  "purple",
      ["\19"] =  "purple",
      R =  "blue",
      r =  "blue",
      ["!"] =  "red",
      t =  "red",
    }
  },

  provider = "  ",
  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { fg = colors.red, bg = colors.default_bg }
  end,
  update = {
    "ModeChanged",
  },
}

local Git = {
    condition = conditions.is_git_repo,

    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,

    hl = { fg = "orange" },


    {   -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = { bold = true }
    },
    -- You could handle delimiters, icons and counts similar to Diagnostics
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "("
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
        hl = { fg = "git_add" },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
        hl = { fg = "git_del" },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
        hl = { fg = "git_change" },
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = ")",
    },
}

local pro2 = {
  provider = "bright_bg",
  hl = { fg = colors.bright_fg, bg = colors.bright_bg },
}

local pro3 = {
  provider = "bright_fg",
  hl = { fg = colors.dark_red, bg = colors.bright_fg },
}

local pro4 = {
  provider = "red",
  hl = { fg = colors.bright_fg, bg = colors.red },
}

local pro5 = {
  provider = "dark_red",
  hl = { fg = colors.bright_fg, bg = colors.dark_red },
}

local pro6 = {
  provider = "green",
  hl = { fg = colors.dark_red, bg = colors.green },
}

local pro7 = {
  provider = "blue",
  hl = { fg = colors.dark_red, bg = colors.blue },
}

local pro8 = {
  provider = "gray",
  hl = { fg = colors.dark_red, bg = colors.gray },
}

local pro9 = {
  provider = "orange",
  hl = { fg = colors.dark_red, bg = colors.orange },
}

local pro10 = {
  provider = "purple",
  hl = { fg = colors.dark_red, bg = colors.purple },
}

local pro11 = {
  provider = "cyan",
  hl = { fg = colors.dark_red, bg = colors.cyan },
}

local pro12 = {
  provider = "diag_warn",
  hl = { fg = colors.dark_red, bg = colors.diag_warn },
}

local pro13 = {
  provider = "diag_hint",
  hl = { fg = colors.dark_red, bg = colors.diag_hint },
}

local pro14 = {
  provider = "diag_info",
  hl = { fg = colors.dark_red, bg = colors.diag_info },
}

local pro14 = {
  provider = "diag_error",
  hl = { fg = colors.dark_red, bg = colors.diag_error },
}

local pro15 = {
  provider = "git_del",
  hl = { fg = colors.dark_red, bg = colors.git_del },
}

local pro16 = {
  provider = "git_add",
  hl = { fg = colors.dark_red, bg = colors.git_add },
}

local pro17 = {
  provider = "git_change",
  hl = { fg = colors.dark_red, bg = colors.git_change },
}

local FileFormat = {
  provider = function()
    local fmt = vim.bo.fileformat
    return fmt ~= 'unix' and fmt:upper()
  end
}
local Ruler = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    provider = "%7(%l/%3L%):%2c %P",
}

local ScrollBar ={
    static = {
        sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
        -- Another variant, because the more choice the better.
        -- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
    end,
    hl = { fg = "blue", bg = "bright_bg" },
}

local test = {
  provider = "Haha",
  hl = { fg = colors.red, bg = "black" }
}
local statusline = { Git, test, vimode, FileFormat, Ruler,  ScrollBar}

heirline.setup(statusline)

