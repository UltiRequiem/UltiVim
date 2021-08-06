# My NeoVim Configuration

My Neovim setup, highly documented to serve as a guide.

## Index

- [About](#About)
- [Mappings](#Mappings)
- [Structure](#Structure)
- [Media](#Media)
- [License](#License)

## About

### Mappings

Leader key: <kbd>space</kbd>

Specif Language Stuff
| Mapping | Mode | Actions |
|:------------------------------|:-----|:--------------------------------------|
| <kbd>space</kbd><kbd>rp</kbd> | n | Go Run current file|
| <kbd>space</kbd><kbd>rp</kbd> | n | Python Run current file|
| <kbd>space</kbd><kbd>rp</kbd> | n | Node Run current file|
| <kbd>space</kbd><kbd>rp</kbd> | n | TypeScript Run current file|
| <kbd>space</kbd><kbd>rp</kbd> | n | Lua Run current file|
| <kbd>space</kbd><kbd>rp</kbd> | n | Ruby Run current file|
| <kbd>space</kbd><kbd>rl</kbd> | n | Ruby Fix current file|

All this mappings are defined in their respective ftplugin.

For the definitions refer to [`plugin/mappings.lua`](./plugin/mappings.lua).

### Structure

```markdown
$HOME/.config/nvim
├── plugin: General Configuration
│ ├── mappings.lua
│ ├── telescope.lua
│ ├── lualine.lua
│ └── etc
├── snippets: snippets in json
│ ├── javascript.json
│ └── etc
├── utils: Some Utils
│ ├── assets/
│ ├── old-plugins-configuration/
│ └── etc
├── ftdetect: Detect filetype not natively supported on Vim
│ ├── stylus.lua
│ ├── zig.lua
│ └── etc
├── ftplugin: Per filetype configuration
│ ├── python.lua
│ ├── javascript.lua
│ ├── ruby.lua
│ └── etc
└── coc-settings.json: Coc Config
```

### Media

![Dashboard Screenshot](./utils/assets/dashboard.png)
![Text Editor Screenshot](./utils/assets/text-editing.png)

See all screenshots on [`utils/assets/`](./utils/assets).

### License

MIT © [UltiRequiem](https://github.com/UltiRequiem).
