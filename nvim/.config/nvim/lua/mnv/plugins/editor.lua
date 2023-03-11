return {
  { "b0o/mapx.nvim" },
  {
    "phaazon/hop.nvim", version = "v2",
    cmd = {
      "HopChar1",
      "HopWord",
    },
    opts= {},
  },
  { "kylechui/nvim-surround", version = "*" },
  { "mattn/emmet-vim" },
  { "editorconfig/editorconfig-vim" },
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
}
