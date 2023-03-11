local userconfig = require "keybinds"

local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

return {
  global = function()
    userconfig.global(map)
  end,
  lsp_attached = function(lsp_info)
    userconfig.lsp_attached(map, lsp_info)
  end
}
