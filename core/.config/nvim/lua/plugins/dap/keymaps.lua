local wk = require 'which-key'
local map = vim.keymap.set
local opts = { noremap = true, silent = true, nowait = true }

wk.add {
  { '<leader>d', group = 'Debugger' },
}

map('n', '<leader>dt', function()
  require('dap').toggle_breakpoint()
end, vim.tbl_extend('force', opts, { desc = 'Toggle Breakpoint' }))

map('n', '<leader>dc', function()
  require('dap').continue()
end, vim.tbl_extend('force', opts, { desc = 'Continue' }))

map('n', '<leader>di', function()
  require('dap').step_into()
end, vim.tbl_extend('force', opts, { desc = 'Step Into' }))

map('n', '<leader>do', function()
  require('dap').step_over()
end, vim.tbl_extend('force', opts, { desc = 'Step Over' }))

map('n', '<leader>du', function()
  require('dap').step_out()
end, vim.tbl_extend('force', opts, { desc = 'Step Out' }))

map('n', '<leader>dr', function()
  require('dap').repl.open()
end, vim.tbl_extend('force', opts, { desc = 'Open REPL' }))

map('n', '<leader>dl', function()
  require('dap').run_last()
end, vim.tbl_extend('force', opts, { desc = 'Run Last' }))

map('n', '<leader>dq', function()
  require('dap').terminate()
  require('dapui').close()
  require('nvim-dap-virtual-text').toggle()
end, vim.tbl_extend('force', opts, { desc = 'Terminate' }))

map('n', '<leader>db', function()
  require('dap').list_breakpoints()
end, vim.tbl_extend('force', opts, { desc = 'List Breakpoints' }))

map('n', '<leader>de', function()
  require('dap').set_exception_breakpoints { 'all' }
end, vim.tbl_extend('force', opts, { desc = 'Set Exception Breakpoints' }))
