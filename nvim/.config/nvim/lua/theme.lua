return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      background = {         -- :h background
        light = "latte",
        dark = "macchiato",
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false,    -- shows the '~' characters after the end of buffers
      term_colors = false            -- sets terminal colors (e.g. `g:terminal_color_0`)
    })
    vim.cmd([[colorscheme catppuccin]])
  end
}

-- {
--   "navarasu/onedark.nvim",
--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
--   priority = 1000, -- make sure to load this before all the other start plugins
--   config = function()
--     require("onedark").setup {
--       style = 'deep',
--       transparent = true,
--       highlights = {
--         LspInlayHint = {fg = '$grey', fmt = 'italic'},
--         ["Comment"] = {fg = '#55aa88' },
--         ["@Comment"] = {fg = '#55aa88' },
--         ["@lsp.type.comment"] = {fg = '#55aa88' },
--       },
--     }
--     vim.cmd([[colorscheme onedark]])
--   end
-- }
--
