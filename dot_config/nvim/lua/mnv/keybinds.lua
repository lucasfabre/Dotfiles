local userconfig = require "keybinds"

local function map(mode, lhs, rhs, opts, desc)
  -- Register to which-key
  local wk_present, wk = pcall(require, "which-key")
  if mode ~= "!" and wk_present and desc ~= nil and desc ~= nil then
    wk.register({
      [ lhs ] = vim.tbl_extend("keep", {rhs, desc, mode=mode}, opts)
    })
  else
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

return {
  before_plugins_load = function()
    vim.g.mapleader = userconfig.leader
  end,
  global = function()
    userconfig.global(map)
  end,
  lsp_attached = function(lsp_info)
    userconfig.lsp_attached(map, lsp_info)
  end
}
