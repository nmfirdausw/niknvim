local neo_tree_exists, neo_tree = pcall(require, "neo-tree")
if not neo_tree_exists then return end

neo_tree.setup({
	close_if_last_window = true,
	popup_border_style = "single",
	enable_diagnostics = false,
  source_selector = {
    winbar = true,
    content_layout = "center",
    tab_labels = {
      filesystem = "" .. " File",
      buffers = "" .. " Bufs",
      git_status = "" .. " Git",
      diagnostics = "裂" .. " Diagnostic",
    },
  },
	default_component_configs = {
		indent = {
			padding = 0,
			with_expanders = false,
		},
		icon = {
			folder_closed = '',
			folder_open = '',
			folder_empty = '',
			default = '',
		},
		modified = {
      symbol = '●',
    },
		git_status = {
			symbols = {
				added = '',
				deleted = '',
				modified = '',
				renamed = '',
				untracked = '',
				ignored = '',
				unstaged = '',
				staged = '',
				conflict = '',
			},
		},
	},
	window = {
    width = 30,
    mappings = {
      o = "open",
      O = function(state) system_open(state.tree:get_node():get_id()) end,
      H = "prev_source",
      L = "next_source",
      h = "toggle_hidden",
    },
	},
  filesystem = {
    follow_current_file = true,
    hijack_netrw_behavior = "open_current",
    use_libuv_file_watcher = true,
  },
  event_handlers = {
    { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
  },
})
