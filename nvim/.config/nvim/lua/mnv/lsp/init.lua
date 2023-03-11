local default_opts = {
  lsp_flags = {
    debounce_text_changes = 150,
  },
  on_attach = function()
  end
}

local setup = function(opts)
  local lsp_setup_arg = {
    lsp_flags = opts.lsp_flags,
    on_attach = function(client, bufnr)
      opts.on_attach({
        client = client,
        bufnr = bufnr
      })
    end
  }
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'lua',
    group = vim.api.nvim_create_augroup('mnv_lua_lsp', { clear = true }),
    callback = function ()
        require("mnv/lsp/lua_ls").setup(lsp_setup_arg)
    end
  })
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'rs',
    group = vim.api.nvim_create_augroup('mnv_rust_lsp', { clear = true }),
    callback = function ()
        require("mnv/lsp/rust_analyzer").setup(lsp_setup_arg)
    end
  })
end

return {
  setup = function(opts)
    opts = opts or default_opts
    opts.lsp_flags = opts.lsp_flags or default_opts.lsp_flags
    opts.on_attach = opts.on_attach or default_opts.on_attach
    setup(opts)
  end
}
