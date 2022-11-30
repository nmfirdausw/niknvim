local heirline_exists, heirline = pcall(require, "heirline")
if not heirline_exists then return end

local conditions = require "heirline.conditions"
local utils = require "heirline.utils"

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

local vimode = require "configs.status.vimode"
local git_branch = require "configs.status.git_branch"
local file_name = require "configs.status.file_name"
local file_path = require "configs.status.file_path"
local git_status = require "configs.status.git_status"
local diagnostics = require "configs.status.diagnostics"
local scroll_bar = require "configs.status.scroll_bar"
local lsp_active = require "configs.status.lsp_active"
local ruler = require "configs.status.ruler"
local file_type = require "configs.status.file_type"
local terminal_name = require "configs.status.terminal_name"
local navic_bar = require "configs.status.navic_bar"

local space = {
  provider = " ",
  hl = { bg = "normal_bg", }
}

local align = { provider = "%=" }

local winbar = {
  {
    condition = function()
      return conditions.buffer_matches({
        buftype = { "nofile", "prompt", "help", "quickfix", "terminal" },
        filetype = { "^git.*", "fugitive" },
      })
    end,
    init = function()
        vim.opt_local.winbar = nil
    end
  },
  { navic_bar, align, file_path }
}

local default_statusline = {
  condition = function()
    return not conditions.buffer_matches({ buftype = { "terminal" } })
  end,
  vimode, git_branch, file_name, git_status, diagnostics, vimode, align,
  vimode, space, lsp_active, space, ruler, space, scroll_bar, space, vimode
}

local terminal_status_line = {
  condition = function()
    return conditions.buffer_matches({ buftype = { "terminal" } })
  end,

  vimode, space, file_type, space, terminal_name, vimode, align,
  vimode, space, ruler, space, scroll_bar,space, vimode
}

local status_line = { terminal_status_line, default_statusline }

heirline.setup(status_line, winbar)
