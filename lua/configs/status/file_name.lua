local file_icon = require "configs.status.file_icon"
local file_flags = require "configs.status.file_flags"
local utils = require "heirline.utils"

local function get_file_name(file)
  return file:match("^.+/(.+)$")
end

local file_name = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "[No Name]" end
    if string.find(filename, "/") then
      filename = get_file_name(filename)
    end
    return filename .. " "
  end,
  hl = { fg = utils.get_highlight("Directory").fg },
}

local file_name_block = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
  hl = { bg = "normal_bg" },
}

local file_name_modifier = {
  hl = function()
    if vim.bo.modified then
      return { fg = "cyan", bold = true, force=true }
    end
  end,
}

file_name = utils.insert(file_name_block,
  file_icon,
  utils.insert(file_name_modifier, file_name),
  unpack(file_flags),
  { provider = '%<'}
)

return file_name
