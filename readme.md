# UltiVim

My Neovim setup, highly documented to serve as a guide.

[Check my whole Dotfiles!](https://github.com/UltiRequiem/dotfiles)

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

## Media

![Dashboard Screenshot](./utils/assets/dashboard.png)
![Text Editor Screenshot](./utils/assets/text-editing.png)

See all screenshots on [`utils/assets/`](./utils/assets).

> Theme:
> [marko-cerovac/material.nvim](https://github.com/marko-cerovac/material.nvim)

## License

Released under the MIT License.