local default_opts = {
  lsp_flags = {
    debounce_text_changes = 150,
  },
  on_attach = function()
  end
}

local lsp_supported_file_found = function()
  require("mason").setup()
  require("mason-lspconfig").setup()
end

local setup_lsp_for_filetype = function(opts)
  vim.api.nvim_create_autocmd('FileType', {
    pattern = opts.filetype,
    group = vim.api.nvim_create_augroup("mnv_" .. opts.filetype .. "_lsp", { clear = true }),
    callback = function()
      lsp_supported_file_found()
      opts.setup()
      vim.cmd 'LspStart'
    end
  })
  if vim.bo.filetype == opts.filetype then
    lsp_supported_file_found()
    opts.setup()
    vim.cmd 'LspStart'
  end
end

local setup = function(opts)
  -- Default setup args
  local lsp_setup_arg = {
    lsp_flags = opts.lsp_flags,
    on_attach = function(client, bufnr)
      opts.on_attach({
        client = client,
        bufnr = bufnr
      })
      if opts.inlay_hints then
        require("lsp-inlayhints").on_attach(client, bufnr)
      end
    end
  }
  -- cmp support
  local cmp_nvim_lsp_loaded, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if cmp_nvim_lsp_loaded then
    local capabilities = cmp_nvim_lsp.default_capabilities()
    lsp_setup_arg.capabilities = capabilities
  end
  -- Setup
  setup_lsp_for_filetype({
    filetype = "lua",
    setup = function()
      require("mnv/lsp/lua_ls").setup(lsp_setup_arg)
    end
  })
  setup_lsp_for_filetype({
    filetype = "rust",
    setup = function()
      require("mnv/lsp/rust_analyzer").setup(lsp_setup_arg)
    end
  })
  setup_lsp_for_filetype({
    filetype = "c",
    setup = function()
      require("mnv/lsp/clangd").setup(lsp_setup_arg)
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
