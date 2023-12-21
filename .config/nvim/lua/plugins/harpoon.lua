require("lazy").setup(function(use)
  use({
    "nvim-lua/plenary.nvim",
  })

  use({
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = "nvim-lua/plenary.nvim",
  })
end)
