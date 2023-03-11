return {
  setup = function(opts)
    require('lspconfig').lua_ls.setup {
      single_file_support = true,
      on_attach = opts.on_attach,
      flags = opts.lsp_flags,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            special = {
              reload = "require",
            },
            path = vim.split(package.path, ';')
          },
          diagnostics = {
            globals = {'vim'},
          },
          workspace = {
            library = {
              vim.api.nvim_get_runtime_file('', true),
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.stdpath('config') .. '/lua'] = true,
            }
          },
        }
      }
    }
  end
}
