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

<kbd>ESCAPE</kbd> alternative: <kbd>CTRL</kbd> <kbd>c</kbd>

| Mapping                       | Mode   | Actions                      |
| :---------------------------- | :----- | :--------------------------- |
| <kbd>CTRL</kbd><kbd>s</kbd>   | normal | Save Current File            |
| <kbd>CTRL</kbd><kbd>n</kbd>   | normal | Toggle Explorer              |
| <kbd>CTRL</kbd><kbd>TAB</kbd> | normal | Jump to next buffer          |
| <kbd>ZE</kbd>                 | normal | Close all                    |
| <kbd>tt</kbd>                 | normal | Duplicate current line       |
| <kbd>gd</kbd>                 | normal | Jump to Definition           |
| <kbd>Leader</kbd><kbd>n</kbd> | normal | Toggle Numbers               |
| <kbd>gr</kbd>                 | normal | Jump to References           |
| <kbd>gi</kbd>                 | normal | Jump to Implementation       |
| <kbd>CTRL</kbd><kbd>p</kbd>   | normal | Fuzzy Find Files             |
| <kbd>CTRL</kbd><kbd>f</kbd>   | normal | Fuzzy Find Words             |
| <kbd>Leader</kbd><kbd>f</kbd> | normal | Jump to word                 |
| <kbd>F3</kbd>                 | normal | Format Current File          |
| <kbd>ESC</kbd>                | normal | Turn off search highlighting |

Resize Windows:

| Mapping                         | Mode   | Actions             |
| :------------------------------ | :----- | :------------------ |
| <kbd>pace</kbd><kbd>Up</kbd>    | normal | Resize -2%          |
| <kbd>pace</kbd><kbd>Down</kbd>  | normal | Resize +2%          |
| <kbd>pace</kbd><kbd>Left</kbd>  | normal | Vertical Resize -2% |
| <kbd>pace</kbd><kbd>Right</kbd> | normal | Vertical Resize +2% |

All this mappings are defined in their respective ftplugin:

| Mapping                       | Mode   | Actions                     |
| :---------------------------- | :----- | :-------------------------- |
| <kbd>space</kbd><kbd>rp</kbd> | normal | Go Run current file         |
| <kbd>space</kbd><kbd>rp</kbd> | normal | Python Run current file     |
| <kbd>space</kbd><kbd>rp</kbd> | normal | Node Run current file       |
| <kbd>space</kbd><kbd>rp</kbd> | normal | TypeScript Run current file |
| <kbd>space</kbd><kbd>rp</kbd> | normal | Lua Run current file        |
| <kbd>space</kbd><kbd>rp</kbd> | normal | Ruby Run current file       |
| <kbd>space</kbd><kbd>rl</kbd> | normal | Ruby Fix current file       |

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
