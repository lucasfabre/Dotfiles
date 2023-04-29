local dap_configurations = require "dap-configuration"

local setup = function()
  require("mason-nvim-dap").setup({
    ensure_installed = {},
    handlers = {
        function(config)
          -- all sources with no handler get passed here
          -- Keep original functionality
          require('mason-nvim-dap').default_setup(config)
        end,
        rust = function(config)
            config.adapters = {
	            type = "executable",
	            command = "lldb-vscode",
              name = "lldb"
            }
            require('mason-nvim-dap').default_setup(config) -- don't forget this!
        end,
    },
  })
  require("dapui").setup()
  local dap = require("dap")
  -- assinging the configurations value directly result in an error
  -- so we assing each configuration independantly (using an for loop)
  for key, value in pairs(dap_configurations) do
    dap.configurations[key] = value
  end
end

return {
  setup = function()
    setup()
  end
}
