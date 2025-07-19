local keybinds = require "mnv/keybinds"
keybinds.before_plugins_load()

require "mnv/lazy"
require "mnv/lazygit"
require "mnv/editor"

local lsp = require "mnv/lsp"
local dap = require "mnv/dap"

keybinds.global()
lsp.setup({
  on_attach = function(lsp_info)
    dap.setup();
    keybinds.lsp_attached(lsp_info)
  end,
  inlay_hints = true
})
