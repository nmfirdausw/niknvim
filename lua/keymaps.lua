local set = vim.keymap.set

-- Neo-tree File Explorer
set("n", "<leader>e", "<cmd>Neotree reveal<cr>", { desc = "Focus File Explorer" })
set("n", "<leader>te", "<cmd>Neotree toggle<cr>", { desc = "Toggle File Explorer" })

-- Telescope 
set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Files" })
set("n", "<leader>fw", function() require("telescope.builtin").live_grep() end, { desc = "Words" })

-- Buffer delete
set("n", "<leader>c", "<cmd>Bdelete<cr>", { desc = "Delete buffer" });

-- Navigate buffers
set("n", "L", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
set("n", "H", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })

-- Terminal
set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
set("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" })
set("n", "<leader>tv", "<cmd>ToggleTerm size=40 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })
set("n", "<leader>tg", "<cmd>TermExec cmd='lazygit'<cr>", { desc = "ToggleTerm lazygit" })

-- Comment
set("n", "<leader>/", function() require('Comment.api').toggle.linewise.current() end, { desc = "Comment line" })
set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", { desc = "Comment line" })

-- Stay in indent mode
set("v", "<", "<gv", { desc = "Indent line" })
set("v", ">", ">gv", { desc = "Unindent line" })

-- Git Signs
set("n", "<leader>gj", function() require("gitsigns").next_hunk() end, { desc = "Next git hunk" })
set("n", "<leader>gk", function() require("gitsigns").prev_hunk() end, { desc = "Previous git hunk" })
set("n", "<leader>gl", function() require("gitsigns").blame_line() end, { desc = "View git blame" })
set("n", "<leader>gp", function() require("gitsigns").preview_hunk() end, { desc = "Preview git hunk" })
set("n", "<leader>gh", function() require("gitsigns").reset_hunk() end, { desc = "Reset git hunk" })
set("n", "<leader>gr", function() require("gitsigns").reset_buffer() end, { desc = "Reset git buffer" })
set("n", "<leader>gs", function() require("gitsigns").stage_hunk() end, { desc = "Stage git hunk" })
set("n", "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, { desc = "Unstage git hunk" })
set("n", "<leader>gd", function() require("gitsigns").diffthis() end, { desc = "View git diff" })
