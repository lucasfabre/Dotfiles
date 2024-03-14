--
-- Keybinds
--
local function harpoon_toggle_telescope(harpoon_files)
    print("debug harpoon_toggle_telescope" .. vim.inspect(harpoon_files))
    local telescope_conf = require("telescope.config").values
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
            results = file_paths,
        }),
        previewer = telescope_conf.file_previewer({}),
        sorter = telescope_conf.generic_sorter({}),
    }):find()
end

return {
  leader = ' ',
  global = function(map)
    -- Hop
    map("n", "s", ":HopChar1<Cr>", { silent = true }, "Hop to character")
    map("n", "S", ":HopWord<Cr>",  { silent = true }, "Hop to word")

    map("n",        "<leader>O",  "<Esc>:Telescope lsp_document_symbols<Cr>",  { silent = true }, "Find in Outline")
    map("n",        "<leader>T",  "<Esc>:Telescope lsp_workspace_symbols<Cr>", { silent = true }, "Find Type")
    map({"i", "n"}, "<C-p>",      "<Esc>:Telescope find_files<Cr>",            { silent = true }, "Find File")
    map({"i", "n"}, "<C-e>",      "<Esc>:Telescope buffers<Cr>",               { silent = true }, "Find Buffer")
    map({"i", "n"}, "<C-h>",      "<Esc>:Telescope keymaps<Cr>",               { silent = true }, "Search Keymaps")
    map("n",        "<leader>fg", ":Telescope grep_string<Cr>",                { silent = true }, "Grep in all files")

    -- Terminal
    map("t",          "<Esc>",  "<C-\\><C-n>",                     { silent = true }, "Exit terminal")
    map("t",          "<C-\\>", "<C-\\><C-n><Esc>:ToggleTerm<Cr>", { silent = true }, "Toggle Terminal")
    map({ "n", "i" }, "<C-\\>", "<Esc>:ToggleTerm<Cr>",            { silent = true }, "Toggle Terminal")

    -- Harpoon
    local harpoon = require("harpoon")
    map("n",        "<leader>ha", function() harpoon:list():append() end, { silent = true }, "Add to Harpoon")
    map("n",        "<leader>ht", function() harpoon_toggle_telescope(harpoon:list()) end, { silent = true }, "Harpoon Telescope")
    map("n",        "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { silent = true }, "Toggle Harpoon menu")
    -- Add harpoon hotkeys 1 to 0 to jump to the corresponding harpoon endtry
    for i = 0, 9 do
      -- handle 0 case
      if i == 0 then i = 10 end
      map("n",        "<leader>h" .. i, function() harpoon:list():select(i) end, { silent = true }, "Jump to harpoon " .. i)
    end

    -- Others
    map("n",        "<leader>gg", ":LazyGitToggle<Cr>",       { silent = true }, "LazyGit")
    map("n",        "<leader>?",  ":WhichKey<Cr>",            { silent = true }, "Which Key")
    map({"i", "n"}, "<C-f>",      "<Esc>:NvimTreeToggle<Cr>", { silent = true }, "File Tree")

  end,

  lsp_attached = function(map, lsp_info)
    local bufnr = lsp_info.bufnr
    local bufopts = { noremap=true, silent=true, buffer=bufnr }

    map('n',          'gD',        vim.lsp.buf.declaration,             bufopts, "Go to Declaration")
    map('n',          'gd',        vim.lsp.buf.definition,              bufopts, "Go to Definition")
    map('n',          'K',         vim.lsp.buf.hover,                   bufopts, "Lsp Hover")
    map('n',          'gi',        vim.lsp.buf.implementation,          bufopts, "Go to Implementation")
    map('n',          '<C-k>',     vim.lsp.buf.signature_help,          bufopts, "Show signature help")
    map('n',          '<space>wa', vim.lsp.buf.add_workspace_folder,    bufopts, "Add folder to workspace")
    map('n',          '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts, "Remove folder to workspace")
    map('n',          '<space>D',  vim.lsp.buf.type_definition,         bufopts, "Type Definition")
    map('n',          '<space>rn', vim.lsp.buf.rename,                  bufopts, "Rename Type")
    map({ 'n', 'i' }, '<C-q>',     vim.lsp.buf.code_action,             bufopts, "Code actions")
    map('n',          'gr',        vim.lsp.buf.references,              bufopts, "Go to References")
    map('n',          '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts, "Format Buffer")
    map('n',          '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts, "List Workspace Folder")

    -- Add debug keybinds here because, if lsp is not configured, dap isn't too
    map('n',          '<leader>dd',        require("dapui").toggle,              bufopts, "Toggle debug view")
  end
}

