return {
  {
    "vimwiki/vimwiki",
    config = function()
      vim.g.vimwiki_list = {
        {
          path = "~/.notes",
          syntax = "markdown",
          ext = ".md",
          links_space_char = "_",
        },
      }
      vim.g.vimwiki_global_ext = 0
    end,
  },
}
