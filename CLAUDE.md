# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration using Packer as the plugin manager. The configuration follows a modular structure with core settings separated from plugin configurations.

## Architecture

### Core Structure
- `init.lua`: Entry point that requires the main agonc module
- `lua/agonc/`: Core configuration modules
  - `init.lua`: Main initialization with cursor position memory and command abbreviations
  - `packer.lua`: Plugin definitions and Packer setup
  - `remap.lua`: Custom key mappings with `,` as leader key
  - `set.lua`: Vim options and settings
- `after/plugin/`: Plugin-specific configurations loaded after plugins

### Key Components

**Plugin Manager**: Uses Packer.nvim for plugin management. Install plugins with `:PackerSync` in Neovim.

**LSP Setup**: Uses lsp-zero.nvim preset with Mason for language server management. TypeScript/JavaScript LSP configured with import preferences.

**File Navigation**: 
- Telescope for fuzzy finding with ripgrep integration
- Harpoon2 for quick file switching
- Oil.nvim for file management
- Neo-tree as file explorer

**Development Tools**:
- nvim-dap for debugging with DAP UI
- Conform.nvim for code formatting
- Treesitter for syntax highlighting
- Git integration via Fugitive and Gitsigns

## Common Commands

### Plugin Management
```
:PackerSync        # Install/update plugins
:PackerClean       # Remove unused plugins
:PackerCompile     # Recompile packer_compiled.lua
```

### Key Bindings (Leader: `,`)
- `,ff` - Find files (Telescope)
- `,fl` - Live grep
- `,fg` - Git files
- `,fb` - Buffers
- `,fs` - Grep string under cursor
- `,a` - Add file to Harpoon
- `,t` - Toggle Harpoon menu
- `,qwer` - Select Harpoon files 1-4
- `,h/,v` - Horizontal/vertical split
- `,`` - Toggle Neo-tree
- `,y` - Copy to system clipboard

### LSP Commands
Standard lsp-zero keybindings are available when in LSP-enabled buffers (gd, gr, K, etc.).

## Development Workflow

1. Open Neovim in the config directory
2. Use `:PackerSync` after modifying `lua/agonc/packer.lua`
3. Restart Neovim or `:source %` after configuration changes
4. Plugin configurations in `after/plugin/` are automatically loaded

## File Organization

Plugin configurations are split into individual files in `after/plugin/` for maintainability. Each plugin has its own configuration file that matches the plugin name (e.g., `telescope.lua`, `lsp.lua`, `harpoon.lua`).