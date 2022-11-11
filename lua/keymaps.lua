local set = vim.keymap.set

-- Neo-tree File Explorer
set('n', '<leader>e', '<cmd>Neotree reveal<cr>', { desc = 'Focus File Explorer' })
set('n', '<leader>te', '<cmd>Neotree toggle<cr>', { desc = 'Toggle File Explorer' })

-- Telescope 
set('n', '<leader>ff', function() require("telescope.builtin").find_files() end, { desc = 'Files' })
set('n', '<leader>fw', function() require("telescope.builtin").live_grep() end, { desc = 'Words' })

-- Buffer delete
set('n', '<leader>c', '<cmd>Bdelete<cr>', { desc = "Delete buffer" });

-- Navigate buffers
set('n', 'L', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next buffer tab' })
set('n', 'H', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Previous buffer tab' })

-- Terminal
set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { desc = 'ToggleTerm float' })
set('n', '<leader>th', '<cmd>ToggleTerm size=10 direction=horizontal<cr>', { desc = 'ToggleTerm horizontal split' })
set('n', '<leader>tv', '<cmd>ToggleTerm size=40 direction=vertical<cr>', { desc = 'ToggleTerm vertical split' })
