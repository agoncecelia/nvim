local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
end)

require('lspconfig').ts_ls.setup({
  init_options = {
    preferences = {
      -- other preferences...
      importModuleSpecifierPreference = 'non-relative',
      importModuleSpecifierEnding = 'minimal',
    },
  }
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
