return {
  setup = function(opts)
    require('lspconfig').lua_ls.setup {
      single_file_support = true,
      on_attach = opts.on_attach,
      flags = opts.lsp_flags,
      settings = {
        ["rust-analyzer"] = {
          procMacro = {
            enable = false
          }
        }
      }
    }
  end
}
