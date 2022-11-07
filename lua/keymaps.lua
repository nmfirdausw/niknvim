local set = vim.keymap.set

-- Neo-tree File Explorer
set('n', '<leader>e', '<cmd>Neotree reveal<cr>', { desc = 'Focus File Explorer' })
set('n', '<leader>te', '<cmd>Neotree toggle<cr>', { desc = 'Toggle File Explorer' })
