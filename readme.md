# UltiVim

A powerful, production-ready Neovim configuration optimized for modern
development workflows with TypeScript, Rust, Go, PHP, and more.

![UltiVim Preview 1](https://github.com/user-attachments/assets/544304e3-584d-4e25-b06d-5c67922b49f7)
![UltiVim Preview 2](https://github.com/user-attachments/assets/c1d85274-9678-4ba3-bdd0-93a779ead0a0)

## ✨ Features

- 🚀 **Performance Optimized** - Lazy-loaded plugins with smart startup
  optimizations
- 🎯 **Language Support** - Full LSP integration for 20+ languages
- 🔧 **Developer Tools** - Integrated debugging, testing, formatting, and
  linting
- 🌊 **Modern UI** - Beautiful status line, file trees, and floating windows
- ⚡ **Smart Keybindings** - Intuitive, mnemonic key mappings with leader key
  (Space)
- 🔍 **Advanced Search** - Telescope, live grep, and project-wide find/replace
- 📁 **Project Management** - Session persistence, file markers, and workspace
  management
- 🎨 **Customizable** - Modular architecture for easy configuration

## 📦 Installation

### Prerequisites

- **Neovim** >= 0.9.0
- **Git**
- **Node.js** >= 16.x (for LSP servers)
- **Python 3** with `pynvim`
- A **Nerd Font** (for icons)

### Quick Start

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.backup

# Clone UltiVim
git clone https://github.com/yourusername/ultivim ~/.config/nvim

# Launch Neovim (plugins will auto-install)
nvim
```

### Post-Installation Setup

1. **Install language servers** via Mason:
   ```vim
   :Mason
   ```

2. **Install formatters and linters**:
   ```vim
   :MasonToolInstaller
   ```

3. **Health check**:
   ```vim
   :checkhealth
   ```

## 🎮 Key Bindings

**Leader Key**: `<Space>`

### Core Navigation

| Mode | Key                      | Action         | Description                       |
| ---- | ------------------------ | -------------- | --------------------------------- |
| n    | `0`                      | `^`            | Go to first non-blank character   |
| n    | `-`                      | `0`            | Go to beginning of line           |
| n    | `<C-Up/Down/Left/Right>` | Resize windows | Smart window resizing             |
| n    | `<M-Up/Down>`            | Move lines     | Move current line up/down         |
| v    | `<M-Up/Down>`            | Move selection | Move selected lines up/down       |
| n    | `<Tab>`                  | Next buffer    | Auto-save and switch buffer       |
| n    | `J`                      | `mzJ`z`        | Join lines (keep cursor position) |

### File Operations

| Key          | Action       | Description                 |
| ------------ | ------------ | --------------------------- |
| `<leader>ff` | Find files   | Fuzzy find files in project |
| `<leader>fg` | Live grep    | Search text in project      |
| `<leader>fb` | Find buffers | Switch between open buffers |
| `<leader>fh` | Help tags    | Search help documentation   |
| `<leader>o`  | Oil toggle   | Toggle file manager         |
| `<space>n`   | NeoTree      | Toggle file tree sidebar    |

### Buffer Management

| Key          | Action          | Description               |
| ------------ | --------------- | ------------------------- |
| `<leader>bn` | Next buffer     | Switch to next buffer     |
| `<leader>bp` | Previous buffer | Switch to previous buffer |
| `<leader>bq` | Delete buffer   | Close current buffer      |
| `<leader>bd` | Delete buffer   | Delete current buffer     |
| `<leader>bo` | Buffer only     | Close all other buffers   |
| `<leader>bu` | Delete all      | Close all buffers         |

### Window & Tab Management

| Key           | Action            | Description             |
| ------------- | ----------------- | ----------------------- |
| `<leader>w`   | Write             | Save current file       |
| `<leader>W`   | Write all         | Save all files          |
| `<leader>qq`  | Quit              | Close current window    |
| `<leader>qa`  | Quit all          | Close all windows       |
| `<leader>qo`  | Window only       | Close all other windows |
| `<leader>so`  | Split only        | Close all other splits  |
| `<leader></>` | Resize horizontal | Resize window width     |
| `<leader>-/+` | Resize vertical   | Resize window height    |

### Terminal Integration

| Key          | Action          | Description              |
| ------------ | --------------- | ------------------------ |
| `<leader>tt` | Terminal tab    | Open terminal in new tab |
| `<leader>tj` | Terminal bottom | Open terminal at bottom  |
| `<leader>tl` | Terminal right  | Open terminal on right   |
| `<leader>tq` | Close tab       | Close current tab        |

### LSP & Code Intelligence

| Key          | Action               | Description                |
| ------------ | -------------------- | -------------------------- |
| `K`          | Hover info           | Show documentation/hover   |
| `gd`         | Go to definition     | Jump to symbol definition  |
| `gD`         | Go to declaration    | Jump to symbol declaration |
| `gi`         | Go to implementation | Jump to implementation     |
| `gr`         | Find references      | Show all references        |
| `<leader>rn` | Rename               | Rename symbol              |
| `<leader>ca` | Code actions         | Show code actions          |
| `<leader>D`  | Type definition      | Go to type definition      |
| `<leader>di` | Toggle inlay hints   | Toggle inlay hints         |

### Diagnostics & Errors

| Key          | Action              | Description                  |
| ------------ | ------------------- | ---------------------------- |
| `[g`         | Previous error      | Jump to previous error       |
| `]g`         | Next error          | Jump to next error           |
| `[G`         | Previous diagnostic | Jump to previous diagnostic  |
| `]G`         | Next diagnostic     | Jump to next diagnostic      |
| `<leader>dd` | Diagnostics to QF   | Send diagnostics to quickfix |
| `<leader>xx` | Trouble toggle      | Toggle diagnostics panel     |

### Git Integration

| Key          | Action        | Description           |
| ------------ | ------------- | --------------------- |
| `<leader>G`  | Git status    | Open Neogit status    |
| `<leader>gl` | Git log       | Open git log in split |
| `[h`         | Previous hunk | Previous git hunk     |
| `]h`         | Next hunk     | Next git hunk         |
| `<leader>do` | Diff open     | Open diff view        |
| `<leader>dq` | Diff close    | Close diff view       |

### Debugging (DAP)

| Key         | Action            | Description              |
| ----------- | ----------------- | ------------------------ |
| `<F5>`      | Continue          | Start/continue debugging |
| `<F1>`      | Step into         | Debug step into          |
| `<F2>`      | Step over         | Debug step over          |
| `<F3>`      | Step out          | Debug step out           |
| `<F12>`     | Disconnect        | Stop debugging           |
| `<leader>/` | Toggle breakpoint | Toggle breakpoint        |
| `<F11>`     | Clear breakpoints | Clear all breakpoints    |
| `<leader>?` | Toggle DAP view   | Toggle debug view        |

### Project Navigation

| Key          | Action         | Description                |
| ------------ | -------------- | -------------------------- |
| `<leader>a`  | Mark file      | Toggle Grapple file marker |
| `<leader>l`  | List marks     | Show marked files          |
| `<leader>.,` | Next/Prev mark | Cycle through marks        |
| `<leader>u`  | Undo tree      | Toggle undo history        |

### Search & Replace

| Key          | Action       | Description                    |
| ------------ | ------------ | ------------------------------ |
| `<leader>sr` | Spectre open | Project-wide find/replace      |
| `<leader>sw` | Search word  | Find/replace word under cursor |
| `s`          | Flash jump   | Quick jump to any position     |

### Clipboard Operations

| Key          | Action               | Description                   |
| ------------ | -------------------- | ----------------------------- |
| `<leader>y`  | Copy to clipboard    | Copy to system clipboard      |
| `<leader>yy` | Copy line            | Copy line to system clipboard |
| `<leader>p`  | Paste from clipboard | Paste from system clipboard   |

### Utility Commands

| Key          | Action           | Description                |
| ------------ | ---------------- | -------------------------- |
| `<leader>df` | Toggle formatter | Toggle auto-formatting     |
| `<leader>cz` | Toggle cmdheight | Toggle command line height |
| `<leader>hw` | Help word        | Help for word under cursor |
| `<BS>`       | Previous buffer  | Load previous buffer       |

## 🔧 Language Support

### Fully Supported Languages

- **TypeScript/JavaScript** - Full IntelliSense, auto-imports, refactoring
- **Go** - Advanced tooling with gopls, testing integration
- **Rust** - Comprehensive rust-analyzer support
- **PHP** - Modern PHP development with Intelephense
- **Python** - Complete development environment
- **C/C++** - clangd integration
- **Lua** - Neovim development optimized
- **Vue.js** - Full SFC support with Volar
- **HTML/CSS** - Advanced web development
- **JSON/YAML** - Schema validation and completion
- **Markdown** - Live preview and editing tools
- **Docker** - Dockerfile and compose support
- **SQL** - Database query assistance

### Language-Specific Features

#### TypeScript/JavaScript

- Auto-import organization
- Advanced refactoring tools
- Vue.js SFC support
- ESLint/Prettier integration

#### Go

- Automatic goimports
- Test coverage highlighting
- Struct tag generation
- Advanced debugging with Delve

#### Rust

- Cargo integration
- Advanced type inference
- Inline type hints
- Comprehensive error handling

## 🎨 Themes & UI

- **Default Theme**: Kanagawa (elegant, readable)
- **Status Line**: Custom Heirline configuration
- **File Tree**: NeoTree with modern icons
- **Completion**: nvim-cmp with multiple sources
- **Syntax**: TreeSitter with advanced highlighting

## ⚙️ Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── config/             # Core configuration
│   │   ├── autocmd.lua     # Autocommands
│   │   ├── keymaps.lua     # Key mappings
│   │   ├── lazy.lua        # Plugin manager
│   │   └── lsp/            # LSP configuration
│   ├── plugins/            # Plugin configurations
│   ├── snippets/           # Code snippets
│   └── util/               # Utility functions
├── ftdetect/               # Filetype detection
└── neoconf.json           # Project settings
```

## 🚀 Performance

- **Startup Time**: ~50-80ms (with 70+ plugins)
- **Memory Usage**: Optimized lazy loading
- **Disabled Plugins**: Removed unnecessary built-ins
- **Smart Loading**: Event-based plugin initialization

## 🛠️ Customization

### Adding New Plugins

Create a new file in `lua/plugins/`:

```lua
return {
    "author/plugin-name",
    event = "BufReadPre",
    config = function()
        require("plugin-name").setup({
            -- your config
        })
    end
}
```

### Custom Key Mappings

Edit `lua/config/keymaps.lua`:

```lua
local u = require("util")
u.key_map("<leader>x", function()
    -- your custom function
end)
```

### Language Server Setup

Add to `lua/config/lsp/servers.lua`:

```lua
lspconfig_setups.your_lsp = {
    settings = {
        -- LSP specific settings
    }
}
```

## 🐛 Troubleshooting

### Common Issues

1. **LSP not working**:
   ```vim
   :LspInfo
   :Mason
   ```

2. **Plugins not loading**:
   ```vim
   :Lazy
   :Lazy sync
   ```

3. **Treesitter issues**:
   ```vim
   :TSUpdate
   :TSInstall <language>
   ```

### Health Checks

```vim
:checkhealth
:checkhealth telescope
:checkhealth lsp
```

## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed contribution guidelines.

### Quick Contribution Guide

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📚 Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim Plugin Manager](https://github.com/folke/lazy.nvim)
- [Mason.nvim Tool Installer](https://github.com/williamboman/mason.nvim)
- [nvim-cmp Completion](https://github.com/hrsh7th/nvim-cmp/pull/1647)

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

Built with inspiration from the Neovim community and powered by:

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin management
- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) -
  Fuzzy finding
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP
  integration
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) -
  Syntax highlighting

---

**UltiVim** - _Ultimate Neovim Experience_ 🚀
