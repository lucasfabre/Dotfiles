--
-- Keybinds
--

return {
  global = function(map)
    -- Movement
    map("n", "s", ":HopChar1<Cr>", { silent = true })
    map("n", "S", ":HopWord<Cr>", { silent = true })
    map("n", "<C-p>", ":Telescope find_files<Cr>", { silent = true })
    map("i", "<C-p>", "<Esc>:Telescope find_files<Cr>", { silent = true })
    map({"i", "n"}, "<C-f>", "<Esc>:NvimTreeToggle<Cr>", { silent = true })
    map({"i", "n"}, "<C-e>", "<Esc>:Telescope buffers<Cr>", { silent = true })
    map("!", "<Esc>", "<C-\\><C-n>", { noremap = true })

    map("n", "<leader>fg", ":Telescope grep_string<Cr>", { silent = true })
    map("n", "<leader>gg", ":LazyGitToggle<Cr>", { silent = true })

    -- Terminal
    map("t", "<Esc>", "<C-\\><C-n>", { silent = true })
    map("t", "<C-\\>", "<C-\\><C-n><Esc>:ToggleTerm<Cr>", { silent = true })
    map({ "n", "i" }, "<C-\\>", "<Esc>:ToggleTerm<Cr>", { silent = true })

  end,

  lsp_attached = function(map, lsp_info)
    local bufnr = lsp_info.bufnr
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    map('n', 'gD', vim.lsp.buf.declaration, bufopts)
    map('n', 'gd', vim.lsp.buf.definition, bufopts)
    map('n', 'K', vim.lsp.buf.hover, bufopts)
    map('n', 'gi', vim.lsp.buf.implementation, bufopts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    map('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    map('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    map('n', 'gr', vim.lsp.buf.references, bufopts)
    map('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  end
}

