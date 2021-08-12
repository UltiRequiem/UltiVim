# UltiVim

![GitHub Super-Linter](https://github.com/UltiRequiem/UltiVim/workflows/Lint%20Code%20Base/badge.svg)
![Repo Size](https://img.shields.io/github/repo-size/ultirequiem/UltiVim?style=flat-square&label=Repo)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
![Lines of Code](https://img.shields.io/tokei/lines/github.com/UltiRequiem/UltiVim?color=blue&label=Total%20Lines)
[![GitMoji](https://img.shields.io/badge/Gitmoji-%F0%9F%8E%A8%20-FFDD67.svg)](https://gitmoji.dev)

My Neovim setup, highly documented to serve as a guide.

## Index

- [About](#About)
- [Mappings](#Mappings)
- [Structure](#Structure)
- [Media](#Media)
- [License](#License)

## About

I have used Neovim for almost a year as my main editor and now I feel very
comfortable using it, so it seemed like a good idea to share my configuration
as it is well documented.

This configuration requires at least Neovim v0.5 to work,
although I currently use Neovim v0.6.

## Mappings

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
| <kbd>gr</kbd>                 | normal | Jump to References           |
| <kbd>gi</kbd>                 | normal | Jump to Implementation       |
| <kbd>CTRL</kbd><kbd>p</kbd>   | normal | Fuzzy Find Files             |
| <kbd>CTRL</kbd><kbd>f</kbd>   | normal | Fuzzy Find Words             |
| <kbd>Leader</kbd><kbd>f</kbd> | normal | Jump to word                 |
| <kbd>F3</kbd>                 | normal | Format Current File          |
| <kbd>Leader</kbd><kbd>n</kbd> | normal | Toggle Numbers               |
| <kbd>ESC</kbd>                | normal | Turn off search highlighting |

Resize Windows:

| Mapping                         | Mode   | Actions             |
| :------------------------------ | :----- | :------------------ |
| <kbd>CTRL</kbd><kbd>Up</kbd>    | normal | Resize -2%          |
| <kbd>CTRL</kbd><kbd>Down</kbd>  | normal | Resize +2%          |
| <kbd>CTRL</kbd><kbd>Left</kbd>  | normal | Vertical Resize -2% |
| <kbd>CTRL</kbd><kbd>Right</kbd> | normal | Vertical Resize +2% |

All this mappings are defined in their respective [`ftplugin`](./ftplugin/):

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

## Structure

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
├── ftdetect: Detect filetypes that are not natively supported
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

> Theme: [mhartington/oceanic-next](https://github.com/mhartington/oceanic-next)

### License

MIT © [UltiRequiem](https://github.com/UltiRequiem).
