-- Harpoon
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function()
  harpoon:list():append()
end, { desc = "Append to harpoon" })
vim.keymap.set("n", "<leader>hH", function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon quick menu" })

vim.keymap.set("n", "<leader>hh", function()
  harpoon:list():select(1)
end, { desc = "Buffer 1" })
vim.keymap.set("n", "<leader>hj", function()
  harpoon:list():select(2)
end, { desc = "Buffer 2" })
vim.keymap.set("n", "<leader>hk", function()
  harpoon:list():select(3)
end, { desc = "Buffer  3" })
vim.keymap.set("n", "<leader>hl", function()
  harpoon:list():select(4)
end, { desc = "Buffer 4" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function()
  harpoon:list():prev()
end, { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>hn", function()
  harpoon:list():next()
end, { desc = "Next buffer" })

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  requires = "nvim-lua/plenary.nvim",
}
