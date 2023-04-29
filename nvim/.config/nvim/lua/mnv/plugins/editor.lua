return {
  {
    "phaazon/hop.nvim", version = "v2",
    cmd = {
      "HopChar1",
      "HopWord",
    },
    opts = {}
  },
  { "m4xshen/autoclose.nvim",                lazy = false, priority = 1000, opts = {} },
  { "editorconfig/editorconfig-vim",         lazy = false, priority = 1000, },
  { "mattn/emmet-vim",                       lazy = false, priority = 1000, },
  { "kylechui/nvim-surround", version = "*", lazy = false, priority = 1000, opts = {} },
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      { "kyazdani42/nvim-web-devicons" },
    },
    cmd = {
      "NvimTreeToggle"
    },
    opts = {
      open_on_setup = false,
      sort_by = "case_sensitive",
      view = {
        adaptive_size = true,
        mappings = {
          list = {
            { key = "u", action = "dir_up" },
          },
        },
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    },
  },
  {
    "folke/which-key.nvim",
    lazy = false,
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
      require("which-key").setup({})
    end,
  },
}
