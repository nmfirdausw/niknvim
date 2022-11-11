local close_func = function(bufnum)
  local bufdelete_exists, bufdelete = pcall(require, "bufdelete")
  if bufdelete_exists then
    bufdelete.bufdelete(bufnum, true)
  else
    vim.cmd["bdelete!"] { args = { bufnum } }
  end
end

local bufferline_exists, bufferline = pcall(require, "bufferline")
if not bufferline_exists then return end

bufferline.setup({
  options = {
    offsets = {
      { filetype = "Outline", text = "", padding = 1 },
    },
    buffer_close_icon = '',
    modified_icon = '',
    close_icon = '',
    close_command = close_func,
    right_mouse_command = close_func,
    max_name_length = 14,
    max_prefix_length = 13,
    tab_size = 20,
    separator_style = "thin",
  },
})
