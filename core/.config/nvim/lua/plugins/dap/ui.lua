local dap = require 'dap'
local ui = require 'dapui'
local dap_virtual_text = require 'nvim-dap-virtual-text'

-- Dap Virtual Text
dap_virtual_text.setup()

ui.setup()

vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

dap.listeners.before.attach.dapui_config = function()
  ui.open()
end
dap.listeners.before.launch.dapui_config = function()
  ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  ui.close()
end
