return {
  {
    "nvim-treesitter/nvim-treesitter",
    priority = 1, -- make sure to load this before all the other start plugins
    config = function()
      require'nvim-treesitter.configs'.setup {
        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,
        ensure_installed = { "comment" },
        highlight = {
        enable = true,
            additional_vim_regex_highlighting = false,
        },
      }
    end,
    build = ":TSUpdate"
  },
}
