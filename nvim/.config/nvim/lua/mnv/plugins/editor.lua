return {
  {
    "phaazon/hop.nvim",
    version = "v2",
    cmd = {
      "HopChar1",
      "HopWord",
    },
    opts = {}
  },
  { "windwp/nvim-autopairs",         lazy = false,  priority = 1000, opts = {} },
  { "editorconfig/editorconfig-vim", lazy = false,  priority = 1000, },
  { "mattn/emmet-vim",               lazy = false,  priority = 1000, },
  { "kylechui/nvim-surround",        version = "*", lazy = false,    priority = 1000, opts = {} },
  { "nmac427/guess-indent.nvim",     lazy = false,  priority = 2000, opts = {} },
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    config = function()
      require("copilot").setup({
        panel = {
          layout = {
            position = "right",
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
        }
      })
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    lazy = false,
    priority = 2000,
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    priority = 2000,
    opts = {},
  },
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = {
      { "kyazdani42/nvim-web-devicons" },
    },
    cmd = {
      "NvimTreeToggle"
    },
    opts = {
      sort_by = "case_sensitive",
      view = {
        adaptive_size = true,
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
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
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
