--
-- Package manager
--
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim' -- telescope dependency
    use 'nvim-telescope/telescope.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'b0o/mapx.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'akinsho/toggleterm.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'navarasu/onedark.nvim'
    use 'mattn/emmet-vim'
    use 'editorconfig/editorconfig-vim'
    use 'ggandor/lightspeed.nvim'
    use {
        'https://codeberg.org/esensar/nvim-dev-container',
        requires = {
            'nvim-treesitter/nvim-treesitter'
        },
    }
    use { 'kylechui/nvim-surround', tag = '*' }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
    }
end)

--
-- Global config
--

require("lightspeed").setup{}
require("nvim-surround").setup{}
require("devcontainer").setup{}
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "help" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

--  Show whitespaces
vim.opt.listchars = 'tab:>·,trail:~,extends:>,precedes:<,space:·'
vim.opt.list = true
--  Tabs is 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.hlsearch = true
vim.opt.smartcase = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.autoindent = true
vim.opt.ruler = true
vim.opt.laststatus = 1
vim.opt.confirm = true
vim.opt.visualbell = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.timeout = true
vim.opt.ttimeout = true
vim.opt.ttimeoutlen= 200
vim.opt.pastetoggle = '<F11>'
vim.opt.termguicolors = true
-- File tree
require("nvim-tree").setup({
  open_on_setup = false,
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
-- Terminal
require("toggleterm").setup{
  open_mapping = [[<c-\>]]
}


--
-- Keybinds
--
local mapx = require('mapx')
local nmap, imap, map, tnoremap, nnoremap = mapx.nmap, mapx.imap, mapx.map, mapx.tnoremap, mapx.nnoremap
nmap("<C-p>", ":Telescope find_files<Cr>", 'silent')
imap("<C-p>", "<Esc>:Telescope find_files<Cr>", 'silent')
nmap("<space>g", ":Telescope grep_string<Cr>", 'silent')
map("<C-f>", "<Esc>:NvimTreeToggle<Cr>", 'silent')
map("<C-e>", "<Esc>:Telescope buffers<Cr>", 'silent')
tnoremap("<Esc>", "<C-\\><C-n>")

--
-- Theme
--
require('onedark').setup {
    style = 'deep',
    transparent = true,
    highlights = {
        Comment = { fg = "#e5c07b" },
    }
}
require('onedark').load()

--
-- LSP Config
--
-- Keybinds
local function lsp_on_attach(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  nmap('gD', vim.lsp.buf.declaration, 'silent', "buffer")
  nmap('gd', vim.lsp.buf.definition, 'silent')
  nmap('K', vim.lsp.buf.hover, 'silent')
  nmap('gi', vim.lsp.buf.implementation, 'silent')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'silent')
  nmap('<space>wa', vim.lsp.buf.add_workspace_folder, 'silent')
  nmap('<space>wr', vim.lsp.buf.remove_workspace_folder, 'silent')
  nmap('<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'silent')
  nmap('<space>D', vim.lsp.buf.type_definition, 'silent')
  nmap('<space>rn', vim.lsp.buf.rename, 'silent')
  nmap('<space>ca', vim.lsp.buf.code_action, 'silent')
  nmap('gr', vim.lsp.buf.references, 'silent')
  nmap('<space>f', vim.lsp.buf.formatting, 'silent')
end
-- Flags
local lsp_flags = {
  debounce_text_changes = 150,
}
-- Mason automaticaly install language-servers
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "sumneko_lua", "rust_analyzer", "clangd" }
}
-- CLang
require'lspconfig'.clangd.setup {
    on_attach = lsp_on_attach,
}
-- Rust
-- lspconfig error workaround "https://github.com/neovim/nvim-lspconfig/issues/1528"
local old_notify = vim.notify
local silence_pat = '[lspconfig] cmd ("cargo'
vim.notify = function(msg, level, opts)
	if (string.sub(msg, 1, string.len(silence_pat)) ~= silence_pat)
	then
		old_notify(msg, level, opts)
	end
end
require'lspconfig'.rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {
            procMacro = {
                enable = false
            }
        }
    },
    on_attach = lsp_on_attach,
}
-- Lua
require('lspconfig').sumneko_lua.setup {
    on_attach = lsp_on_attach,
    flags = lsp_flags,
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
-- python
require('lspconfig').jedi_language_server.setup {}

--
-- Completion
--
local cmp = require'cmp'
cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
})
--
-- Language specific config
--

-- Markdown
vim.g.markdown_fenced_languages = { 'html', 'python', 'ruby', 'vim', 'bash=sh' }

