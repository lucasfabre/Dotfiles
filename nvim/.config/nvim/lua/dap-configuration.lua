local Job = require('plenary.job')

return {
  python = {
    {
      type = 'python';
      request = 'launch';
      name = "Launch file";
      program = "${file}";
      pythonPath = function()
        return '/usr/bin/python'
      end;
    },
  },
  rust = {
    {
      type = 'cppdbg',
      request = 'launch',
      name = "Test",
      program = function()
        return coroutine.create(function(dap_run_co)
          Job:new({
            command = 'cargo',
            args = { 'test', '--no-run', '--message-format=json' },
            on_exit = function(j, return_val)
              if return_val ~= 0 then
                vim.schedule(function()
                  vim.notify("Error while running cargo test, resolve all compile errors and try again",
                    vim.log.levels.ERROR)
                  coroutine.resume(dap_run_co, nil)
                end)
              else
                vim.schedule(function()
                  local executable = nil
                  for _, line in pairs(j:result()) do
                    local artifact = vim.fn.json_decode(line)
                    if artifact.executable ~= vim.NIL and artifact.executable ~= nil then
                      executable = artifact.executable
                    end
                  end
                  if executable ~= nil then
                    coroutine.resume(dap_run_co, executable)
                  else
                    vim.schedule(function()
                      vim.notify("Could not find any artifact builded by cargo test, please check if cargo test is working and try again"
                        , vim.log.levels.ERROR)
                      coroutine.resume(dap_run_co, nil)
                    end)
                  end
                end)
              end
            end,
          }):start()
        end)
      end,
      args = {},
      cwd = "${workspaceFolder}"
    },
    {
      type = 'cppdbg';
      request = 'launch';
      name = "Binary";
      program = "target/debug/deps/clavy_core-0e7725b479ae994a";
      args = {};
      cwd = "${workspaceFolder}"
    },
  },
}
