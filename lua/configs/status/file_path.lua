local file_icon = require "configs.status.file_icon"
local file_flags = require "configs.status.file_flags"
local utils = require "heirline.utils"

local file_path_block = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
  hl = { fg = "white" },
}

local file_path_modifier = {
  hl = function()
    if vim.bo.modified then
      return { fg = "white", bold = true, force=true }
    end
  end,
}

local file_path = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "[No Name]" end
    return filename .. " "
  end,
  hl = { fg = "white" },
}

file_path = utils.insert(file_path_block,
  file_icon,
  utils.insert(file_path_modifier, file_path),
  unpack(file_flags),
  { provider = '%<'}
)

return file_path
