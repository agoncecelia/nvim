local dap = require('dap')
local dapui = require('dapui')

-- DAP UI setup
dapui.setup()

-- Automatically open UI when debugging starts
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Enable virtual text
require("nvim-dap-virtual-text").setup()

-- js-debug adapter setup
require("dap-vscode-js").setup({
  -- Path to the js-debug installation
  -- debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
  -- Command to use to launch the debug server. 
  -- Note: The debugger_cmd should only be set if you've installed the js-debug manually
  -- debugger_cmd = { "js-debug-adapter" },
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})

-- NestJS configuration
for _, language in ipairs({ "typescript", "javascript" }) do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch NestJS",
      runtimeExecutable = "npm",
      runtimeArgs = {"run", "start:debug"},
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach to NestJS",
      processId = require('dap.utils').pick_process,
      cwd = "${workspaceFolder}",
    }
  }
end

-- Keymaps
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

-- Clear all dap breakpoints
vim.keymap.set('n', '<Leader>db', function()
  require('dap').clear_breakpoints()
end)

-- Stop debugger
vim.keymap.set('n', '<Leader>dX', function()
  require('dap').terminate()
end)

-- Signs
vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='▶️', texthl='', linehl='', numhl=''})
