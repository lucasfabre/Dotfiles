return {
  setup = function(opts)
    require('lspconfig')['rust_analyzer'].setup {
      autostart = true,
      capabilities = opts.capabilities,
      single_file_support = true,
      on_attach = opts.on_attach,
      flags = opts.lsp_flags,
      settings = {
        ["rust-analyzer"] = {
          procMacro = {
            enable = true
          }
        }
      }
    }
  end
}
