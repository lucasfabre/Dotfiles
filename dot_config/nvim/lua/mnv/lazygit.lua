local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  hidden = true,
})

local function lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_create_user_command("LazyGitToggle", lazygit_toggle, {})
