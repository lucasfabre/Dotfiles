return {
  {
    "folke/noice.nvim",
    lazy = false,
    opts = {
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu togetherui
        long_message_to_split = false, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      }
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          background_colour = "#000000"
        }
      }
    }
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    opts={},
    lazy = false,
    config = function(lsp_lines, config)
      print("lsp_lines")
      require("lsp_lines").setup()
      vim.diagnostic.config({
        update_in_insert = false,
        signs = true,
        severity_sort = true,
        virtual_text = false, -- Since we're using lsp_lines
        virtual_lines = { only_current_line = true },
      })
    end
  }
}

