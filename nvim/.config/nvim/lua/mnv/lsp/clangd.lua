return {
  setup = function(opts)
    require('lspconfig').clangd.setup {
      capabilities = opts.capabilities,
      single_file_support = true,
      on_attach = opts.on_attach,
      flags = opts.lsp_flags,
    }
  end
}
