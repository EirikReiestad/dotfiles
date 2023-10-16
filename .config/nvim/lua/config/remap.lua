local api = vim.api

vim.g.mapleader = " "
api.nvim_set_keymap("n", "<leader>pv", ":Ex<CR>", {noremap = true})

