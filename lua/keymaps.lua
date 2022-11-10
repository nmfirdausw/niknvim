local set = vim.keymap.set

-- Neo-tree File Explorer
set('n', '<leader>e', '<cmd>Neotree reveal<cr>', { desc = 'Focus File Explorer' })
set('n', '<leader>te', '<cmd>Neotree toggle<cr>', { desc = 'Toggle File Explorer' })

-- Telescope 
set('n', '<leader>ff', function() require("telescope.builtin").find_files() end, { desc = 'Files' })
set('n', '<leader>fw', function() require("telescope.builtin").live_grep() end, { desc = 'Words' })