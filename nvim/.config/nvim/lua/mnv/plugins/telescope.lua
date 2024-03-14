return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
     pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        lsp_document_symbols = {
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top"
          },
        },
      },
      extensions = {
        "notify"
      }
    },
    lazy = false,
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    config = function(LazyPLugin, opts)
      require("telescope").setup(opts);
      require("telescope").load_extension("notify")
    end
  }
}

