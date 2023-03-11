require "mnv/lazy"
require "mnv/lazygit"
require "mnv/editor"

local lsp = require "mnv/lsp"
local keybinds = require "mnv/keybinds"

keybinds.global()
lsp.setup({
  on_attach = function(lsp_info)
    keybinds.lsp_attached(lsp_info)
  end
})
